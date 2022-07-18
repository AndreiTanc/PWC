//
//  JWTRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

open class JWTRequest<Response: JWTResponse>: BaseRequest<Response> {
    override init(headers: [String : String] = [:], parameters: [String : Any] = [:], fetchQueue: NetworkingQueueType = .background, resultQueue: NetworkingQueueType = .main, forceURLEncoding: Bool = false) {
        super.init(
            headers: JWTRequest.mutateHeaders(headers: headers),
            parameters: parameters,
            fetchQueue: fetchQueue,
            resultQueue: resultQueue,
            forceURLEncoding: forceURLEncoding
        )
    }
    
    private class func mutateHeaders(headers: [String: String]) -> [String: String] {
        var mutableHeaders = headers
        mutableHeaders["Authorization"] = "Bearer \(AppUserDefaults.token ?? "")"
        return mutableHeaders
    }
}

public class JWTResponse: Response {}
