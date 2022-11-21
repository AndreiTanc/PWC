//
//  RankingsRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 26.08.2022.
//

import Foundation

class RankingsRequest: JWTRequest<RankingsResponse> {
    public override var method: ApiMethod {
        return .get("/api/v1/closed/rankings")
    }
    
    init() {
        super.init(tokenType: .loggedUser)
    }
}

