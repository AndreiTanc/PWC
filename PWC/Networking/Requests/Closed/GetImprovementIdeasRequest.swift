//
//  GetImprovementIdeasRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 25.08.2022.
//

import Foundation

class GetImprovementIdeasRequest: JWTRequest<EmptyResponse> {
    public override var method: ApiMethod {
        return .get("/api/v1/closed/social/improvement-ideas")
    }
    
    init() {
        super.init(tokenType: .loggedUser)
    }
}
