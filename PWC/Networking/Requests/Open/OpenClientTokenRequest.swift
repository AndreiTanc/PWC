//
//  OpenAccessTokenRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 22.07.2022.
//

import Foundation

class OpenClientTokenRequest: BaseRequest<TokenResponse> {
    public override var method: ApiMethod {
        return .post("/oauth/token")
    }
    
    public init() {
        let model = Model(grant_type: "client_credentials",
                          client_id: Constants.RequestConstants.clientId.rawValue,
                          client_secret: Constants.RequestConstants.clientSecret.rawValue)
        super.init(parameters: model.json ?? [:])
    }
}

extension OpenClientTokenRequest {
    struct Model: Encodable {
        let grant_type: String
        let client_id: String
        let client_secret: String
    }
    
    private enum CodingKeys : String, CodingKey {
        case grantType = "grant_type", clientId = "client_id", clientSecret = "client_secret"
    }
}

struct TokenResponse: Response {
    var tokenType: String
    var expiresIn: Int
    var accessToken: String
}
