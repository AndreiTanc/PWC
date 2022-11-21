//
//  LinesOfServiceRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 25.08.2022.
//

import Foundation

class LinesOfServiceRequest: JWTRequest<EmptyResponse> {
    public override var method: ApiMethod {
        return .get("/api/v1/closed/social/audience/lines-of-service")
    }
    
    init() {
        super.init(tokenType: .loggedUser)
    }
}
