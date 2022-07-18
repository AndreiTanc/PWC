//
//  ApiRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

public protocol ApiRequest {
    
    associatedtype ApiResponse: Response
    
    var fetchQueue: NetworkingQueueType {get}
    var resultQueue: NetworkingQueueType {get}
    
    var method: ApiMethod {get}
    var parameters: [String: Any] {get}
    var headers: [String: String] {get}
    var forceURLEncoding: Bool {get}
}
