//
//  OpenPasswordTokenRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 25.07.2022.
//

import Foundation

class OpenPasswordTokenRequest: JWTRequest<TokenResponse> {
    public override var method: ApiMethod {
        return .post("/oauth/token")
    }
    
    public init(username: String, password: String) {
        let model = Model(grant_type: "password",
                          client_id: Constants.RequestConstants.loginClientId.rawValue,
                          client_secret: Constants.RequestConstants.loginClientSecret.rawValue,
                          username: username,
                          password: password)
        
        super.init(parameters: model.json ?? [:])
    }
}

extension OpenPasswordTokenRequest {
    struct Model: Encodable {
        let grant_type: String
        let client_id: String
        let client_secret: String
        
        let username: String
        let password: String
    }
    
    private enum CodingKeys : String, CodingKey {
        case grantType = "grant_type", clientId = "client_id", clientSecret = "client_secret"
    }
}
