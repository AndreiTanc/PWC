//
//  ClosedLogOutRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 22.08.2022.
//

import Foundation

class ClosedLogOutRequest: JWTRequest<EmptyResponse> {
    public override var method: ApiMethod {
        return .get("/api/v1/closed/user/logout")
    }
    
    public init() {
        super.init(tokenType: .loggedUser)
    }
}
