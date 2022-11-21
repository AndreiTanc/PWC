//
//  RegisterRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 21.07.2022.
//

import Foundation

struct EmptyResponse: Response {}

class RegisterRequest: JWTRequest<EmptyResponse> {
    public override var method: ApiMethod {
        return .post("/api/v1/open/register")
    }
    
    public init(model: Model) {
        super.init(parameters: model.json ?? [:])
    }
}

extension RegisterRequest {
    struct Model: Encodable {
        let name: String
        let email: String
        let password: String
    }
}
