//
//  RefreshTokenMechanismDataProvider.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation
import Alamofire

public protocol RefreshTokenMechanismDataProvider {
    var refreshToken: String? {get}
    var authToken: String? {get}
    
    func shouldBeRetried(request: URLRequest) -> Bool
    func refreshTokens(completion: @escaping (Bool) -> Void)
    func logOutUser()
}

public final class RefreshTokenMechanism: RequestInterceptor {
    private var provider: RefreshTokenMechanismDataProvider?
    
    public init(provider: RefreshTokenMechanismDataProvider) {
        self.provider = provider
    }
    
    public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        guard provider?.shouldBeRetried(request: urlRequest) == true else {return urlRequest}

        if let auth = provider?.authToken {
            return apply(token: auth, to: urlRequest)
        }

        return urlRequest
    }
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard provider?.shouldBeRetried(request: urlRequest) == true else {return}
        
        if let auth = provider?.authToken {
            completion(.success(apply(token: auth, to: urlRequest)))
        }
        
        completion(.success(urlRequest))
    }
    
    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        let url = request.request?.url?.description ?? ""
        let statusCode = request.response?.statusCode ?? 0

        guard let _ = error as? AFError else {
            completion(.doNotRetry)
            return
        }

        if let req = request.request,
           provider?.shouldBeRetried(request: req) == true,
           statusCode == 401 {
            if request.retryCount < 3 {
                refreshToken { (didRefreshToken) in
                    print("Should retry - \(url)")
                    if didRefreshToken {
                        completion(.retryWithDelay(1))
                    } else {
                        completion(.doNotRetry)
                    }
                }
            } else {
                provider?.logOutUser()
            }
        } else {
            completion(.doNotRetry)
        }
    }
    
    private func refreshToken(completion: @escaping (Bool) -> Void) {
        provider?.refreshTokens(completion: completion)
    }
    
    private func apply(token: String, to request: URLRequest) -> URLRequest {
        var req = request
        req.setValue("Bearer " + token, forHTTPHeaderField: "X-Authorization")
        
        return req
    }
}
