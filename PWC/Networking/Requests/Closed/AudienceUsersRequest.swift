//
//  AudienceUsersRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 25.08.2022.
//

import Foundation

class AudienceUsersRequest: JWTRequest<EmptyResponse> {
    public override var method: ApiMethod {
        return .get("/api/v1/closed/social/audience/users")
    }
    
    init(lineOfService: String, department: String) {
        super.init(parameters: ["line_of_service": lineOfService,
                                "department": department],
                   tokenType: .loggedUser)
    }
}
