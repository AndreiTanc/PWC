//
//  PointsRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 15.08.2022.
//

import Foundation

class PointsRequest: JWTRequest<PointsResponse> {
    public override var method: ApiMethod {
        return .get("/api/v1/closed/points")
    }
    
    init() {
        super.init(tokenType: .loggedUser)
    }
}
