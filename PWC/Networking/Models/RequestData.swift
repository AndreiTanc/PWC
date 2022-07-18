//
//  RequestData.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation
import Alamofire

struct RequestData {
    let uri: String
    let method: HTTPMethod
    let headers: HTTPHeaders
    let encoding: ParameterEncoding
    let parameters: [String: Any]?
    
    init<T: ApiRequest>(request: T, config: Config) {
        uri = request.method.getUri(base: config.baseUri)
        method = RequestData.toAlamofire(method: request.method)
        headers = RequestData.headers(for: request, config: config)
        if request.forceURLEncoding {
            encoding = URLEncoding.default
        } else {
            encoding = method == .get ? URLEncoding.default : JSONEncoding.prettyPrinted
        }
        parameters = request.parameters.count == 0 ? [:] : request.parameters
    }
    
    private static func headers<T: ApiRequest>(for request: T, config: Config) -> HTTPHeaders {
        var headers = config.globalHeaders
        request.headers.forEach({headers[$0.key] = $0.value})
        return headers
    }
    
    private static func toAlamofire(method: ApiMethod) -> HTTPMethod {
        switch method {
        case .post:
            return HTTPMethod.post
        case .get:
            return HTTPMethod.get
        case .put:
            return HTTPMethod.put
        case .delete:
            return HTTPMethod.delete
        }
    }
}
