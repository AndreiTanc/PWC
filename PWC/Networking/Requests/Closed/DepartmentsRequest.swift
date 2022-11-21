//
//  DepartmentsRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 25.08.2022.
//

import Foundation

class DepartmentsRequest: JWTRequest<EmptyResponse> {
    public override var method: ApiMethod {
        return .get("/api/v1/closed/social/audience/departments")
    }
    
    init(lineOfService: String) {
        super.init(parameters: ["line_of_service": lineOfService],
                   tokenType: .loggedUser)
    }
}
