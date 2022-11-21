//
//  OpenLogOutRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 11.08.2022.
//

import Foundation

class OpenLogOutRequest: JWTRequest<EmptyResponse> {
    public override var method: ApiMethod {
        return .get("/api/v1/open/logout")
    }
    
    public init() {
        super.init(tokenType: .loggedUser)
    }
}
