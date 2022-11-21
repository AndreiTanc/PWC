//
//  JWTRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

enum TokenType {
    case openAccess
    case loggedUser
}

open class JWTRequest<Response: PWC.Response>: BaseRequest<Response> {
    var typeOfToken: TokenType = .openAccess
        
    init(headers: [String : String] = [:], parameters: [String : Any] = [:], fetchQueue: NetworkingQueueType = .background, resultQueue: NetworkingQueueType = .main, forceURLEncoding: Bool = false, tokenType: TokenType = .openAccess) {
        super.init(
            headers: JWTRequest.mutateHeaders(headers: headers, tokenType: tokenType),
            parameters: parameters,
            fetchQueue: fetchQueue,
            resultQueue: resultQueue,
            forceURLEncoding: forceURLEncoding
        )
    }
    
    private class func mutateHeaders(headers: [String: String], tokenType: TokenType) -> [String: String] {
        var mutableHeaders = headers
        
        let token: String?
        switch tokenType {
        case .openAccess:
            token = AppUserDefaults.openClientToken
        case .loggedUser:
            token = AppUserDefaults.passwordToken
        }
        
        mutableHeaders["Authorization"] = "Bearer \(token ?? "")"
        return mutableHeaders
    }
}
