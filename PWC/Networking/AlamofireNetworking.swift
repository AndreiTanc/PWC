//
//  AlamofireNetworking.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import UIKit
import Alamofire
import AlamofireImage
import Combine
import Network

public class AlamofireNetworking: NSObject, Networking {
    
    private var config: Config
    private var networkingMonitor = NWPathMonitor()
    private var refreshTokenMechanism: RequestInterceptor?
    private var interceptors: [WeakObject] = []
    private var currentReachabilityTask: DispatchWorkItem?

    @Published public var isReachable: Bool = false


    public var hasSessionCookie: Bool {
        return getSessionCookie() != nil
    }

    public var isOnWifi: Bool {
        return networkingMonitor.currentPath.usesInterfaceType(.wifi)
    }

    private var isReachableStream: AnyCancellable?
    
    private lazy var session: Session = {
        return Session.default
    }()

    //not sure if i need this but in order to not break something in this stage of the development i must do this
    private lazy var alamofireImageSession: Session = {
        return Session.default
    }()

    public required init(config: Config) {
        self.config = config
        super.init()

//        if config.shouldDisableTrustEvaluator {
//            UIImageView.af.sharedImageDownloader = ImageDownloader(session: alamofireImageSession)
//        }

        self.startListeningForConnection()
    }

    public func observeConnection(observer: @escaping (Bool) -> Void) {
        isReachableStream = $isReachable.sink(receiveValue: observer)
    }

    public func set(refreshTokenMechanism: RequestInterceptor?) {
        self.refreshTokenMechanism = refreshTokenMechanism
    }

    public func set(url: String) {
        self.config.baseUri = url
    }

    public func set(globalHeaders: HTTPHeaders) {
        config.globalHeaders = Config.defaultGlobalHeaders()
        globalHeaders.forEach({config.globalHeaders.update($0)})

    }

    public func invalidateSession() {
        guard let sessionCookie = getSessionCookie() else {
            return
        }

        HTTPCookieStorage.shared.deleteCookie(sessionCookie)
    }

    public func add(interceptor: NetworkingInterceptor) {
        interceptors.append(.init(interceptor))
    }

    //MARK: - Private functions
    private func startListeningForConnection() {
        self.networkingMonitor.pathUpdateHandler = { path in
            self.isReachable = path.status == .satisfied
            debugPrint("Network is reachable: \(self.isReachable)")
        }

        let reachabilityQueue = DispatchQueue(label: "Reachability")
        self.networkingMonitor.start(queue: reachabilityQueue)
    }

    private func getSessionCookie() -> HTTPCookie? {
        HTTPCookieStorage.shared.cookies?.filter({$0.name == "session"}).first
    }
    
    @discardableResult
    public func call<Req>(request: Req, onSuccess: @escaping (Req.ApiResponse) -> Void, onError: @escaping Fail) -> CancelableRequest where Req : ApiRequest {
        
        let dispatchQueue = getQueueFrom(networkingQueue: request.fetchQueue)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = config.keyDecodingStrategy
        decoder.dateDecodingStrategy = config.dateDecodingStrategy
        
        let requestData = RequestData(request: request, config: config)
        let cancelable = session.request(requestData.uri,
                                         method: requestData.method,
                                         parameters: requestData.parameters,
                                         encoding: requestData.encoding,
                                         headers: requestData.headers,
                                         interceptor: refreshTokenMechanism)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Req.ApiResponse.self, queue: dispatchQueue, decoder: decoder, completionHandler: { [weak self] (response) in
                self?.handleResponseData(response: response, request: request, onSuccess: onSuccess, onError: onError)
            })

        return cancelable
    }

    @discardableResult
    public func download<Req>(request: Req, onSuccess: @escaping (URL) -> Void, onError: @escaping Fail) -> CancelableRequest where Req : ApiRequest {

        let requestData = RequestData(request: request, config: config)

        let destination: DownloadRequest.Destination = { _, _ in
            var tempURL = URL(fileURLWithPath: NSTemporaryDirectory())
            tempURL.appendPathComponent("track.kml")
            return (tempURL, [.removePreviousFile])
        }



        let cancelable = session.download(requestData.uri,
                                          method: requestData.method,
                                          parameters: requestData.parameters,
                                          encoding: requestData.encoding,
                                          headers: requestData.headers,
                                          interceptor: refreshTokenMechanism,
                                          to: destination)
            .validate(statusCode: 200..<300)
            .responseURL { response in

                if let error = response.error {
                    onError(ApiError(error: error))
                } else if let fileUrl = response.fileURL {
                    onSuccess(fileUrl)
                } else {
                    onError(ApiError(message: "An unidentified error has occurred during download"))
                }
            }
        
        return cancelable
    }

    public func upload<Req>(data: [UploadRequestData], with req: Req, onSuccess: @escaping (Req.ApiResponse) -> Void, onError: @escaping Fail) where Req : ApiRequest {
        let requestData = RequestData(request: req, config: config)
        _ = AF.upload(multipartFormData: { (formData) in
            data.forEach({$0.appendTo(formData: formData)})
        }, to: requestData.uri,
        method: requestData.method,
        headers: requestData.headers,
        interceptor: refreshTokenMechanism)
        .responseDecodable(of: Req.ApiResponse.self) { [weak self] (response) in
            guard let error = response.error else {
                self?.handleResponseData(response: response, request: req, onSuccess: onSuccess, onError: onError)
                return
            }
            onError(ApiError(error: error))
        }
    }

    private func handleResponseData<Req>(response: DataResponse<Req.ApiResponse, AFError>, request: Req, onSuccess: @escaping (Req.ApiResponse) -> Void, onError: @escaping Fail) where Req: ApiRequest {
        
        let requestData = RequestData(request: request, config: config)

        
        var log = """
        \n
        ---------Request start---------
        Full url: \(requestData.uri)
        Global headers: \(response.request?.allHTTPHeaderFields ?? requestData.headers.dictionary)
        Task Interval: \(String(describing: response.metrics?.taskInterval))
        Serialisation duration: \(String(describing: response.serializationDuration))
        \(request)
        """
        
        guard let data = response.data else {
            log = """
            \(log)
            "Received error: No data found"
            """
            getQueueFrom(networkingQueue: request.resultQueue).async {
                onError(ApiError(message: "No data found", code: 0))
            }
            return
        }
        
        log = """
        \(log)
        Received response:\n \(data.prettyPrintedJSONString)
        """
        
        let decoder = JSONDecoder()

        switch response.result {
        case .success(let response):
            log = """
            \(log)
            Received success
            """

            handleSuccess(request: request, response: response, completed: onSuccess)
        case .failure(let error):
            if let model = try? decoder.decode(ApiError.self, from: data) {
                handleError(request: request, error: model, log: &log, onError: onError)
            } else {
                handleError(request: request, error: ApiError(error: error), log: &log, onError: onError)
            }
        }

        log = """
        \(log)
        ---------Request end---------
        """

        #if DEBUG
            print(log)
        #endif
    }
    
    private func handleSuccess<Req>(request: Req, response: Req.ApiResponse, completed: @escaping (Req.ApiResponse) -> Void) where Req: ApiRequest {
        getQueueFrom(networkingQueue: request.resultQueue).async {
            completed(response)
        }
    }
    
    private func handleError<Req: ApiRequest>(request: Req, error: ApiError, log: inout String, onError: @escaping (ApiError) -> Void) {
        log = """
        \(log)
        Received error: \(error)
        """
        
        getQueueFrom(networkingQueue: request.resultQueue).async { [weak self] in
            guard let self = self else {return}
            self.interceptors.forEach({$0.interceptor?.networking(networking: self, didReceiveError: error)})
            
            if error.wasIntercepted == false || error.wasIntercepted == nil {
                onError(error)
            }
        }
    }

    deinit {
        networkingMonitor.cancel()
    }
}


extension AlamofireNetworking {
    fileprivate func getQueueFrom(networkingQueue: NetworkingQueueType) -> DispatchQueue {
        switch networkingQueue {
        case .main:
            return .main
        case .background:
            return config.queue
        case .custom(let queue):
            return queue
        }
    }
}

extension DataRequest: CancelableRequest {
    public func cancelRequest() {
        cancel()
    }
}

extension DownloadRequest: CancelableRequest {
    public func cancelRequest() {
        cancel()
    }
}
