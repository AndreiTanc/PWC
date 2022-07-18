//
//  BaseRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation
import Alamofire

open class BaseRequest<Resp: Response>: ApiRequest {
    
    open var method: ApiMethod {
        fatalError("Should implement in higher classes")
    }
    
    public typealias ApiResponse = Resp
    
    public let headers: [String : String]
    public let parameters: [String : Any]
    public let forceURLEncoding: Bool
    
    public let fetchQueue: NetworkingQueueType
    public var resultQueue: NetworkingQueueType
    
    public init(headers: [String: String] = [:], parameters: [String: Any] = [:], fetchQueue: NetworkingQueueType = .background, resultQueue: NetworkingQueueType = .main, forceURLEncoding: Bool = false) {
        self.headers = headers
        self.parameters = parameters
        self.fetchQueue = fetchQueue
        self.resultQueue = resultQueue
        self.forceURLEncoding = forceURLEncoding
    }
}

extension BaseRequest: CustomStringConvertible {
    public var description: String {
        return """
        
        Request: \(type(of: self))
        Method: \(method)
        Headers: \(headers)
        Parameters: \(parameters)
        Response: \(ApiResponse.self)
        """
    }
}
