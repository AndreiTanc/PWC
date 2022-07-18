//
//  Networking.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation
import Alamofire
import Combine

public typealias Success<T> = (T) -> Void
public typealias Fail = (ApiError) -> Void

public protocol Networking {
    var isReachable: Bool {get}

    init(config: Config)
    
    func add(interceptor: NetworkingInterceptor)
    func observeConnection(observer: @escaping (Bool) -> Void)

    @discardableResult
    func call<Req>(request: Req, onSuccess: @escaping Success<Req.ApiResponse>, onError: @escaping Fail) -> CancelableRequest where Req: ApiRequest
    func upload<Req>(data: [UploadRequestData], with req: Req, onSuccess: @escaping (Req.ApiResponse) -> Void, onError: @escaping Fail) where Req : ApiRequest
}

extension Networking {
    public func upload<Req>(data: UploadRequestData, with req: Req, onSuccess: @escaping (Req.ApiResponse) -> Void, onError: @escaping Fail) where Req : ApiRequest {
        self.upload(data: [data], with: req, onSuccess: onSuccess, onError: onError)
    }
}

public struct Config {
    public var baseUri: String
    public var globalHeaders: HTTPHeaders
    public var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase
    public var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .millisecondsSince1970
    public var queue: DispatchQueue
    
    public init(baseUri: String,
                globalHeaders: HTTPHeaders = Config.defaultGlobalHeaders(),
                keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase,
                dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .millisecondsSince1970,
                queue: DispatchQueue = DispatchQueue(label: "com.mvnetworking.api.networking", qos: .background, attributes: .concurrent)) {
        self.baseUri = baseUri
        self.keyDecodingStrategy = keyDecodingStrategy
        self.dateDecodingStrategy = dateDecodingStrategy
        self.globalHeaders = globalHeaders
        self.queue = queue
    }
    
    public static func defaultGlobalHeaders() -> HTTPHeaders {
        return HTTPHeaders(arrayLiteral: .contentType("application/json"))
    }
}

public enum NetworkingQueueType {
    case main
    case background
    case custom(DispatchQueue)
}

public protocol CancelableRequest {
    func cancelRequest()
}
