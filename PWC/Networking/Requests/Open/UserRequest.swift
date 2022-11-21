//
//  UserRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 29.07.2022.
//

import Foundation
import Alamofire

class UserRequest: JWTRequest<UserResponse> {
    public override var method: ApiMethod {
        return .get("/api/v1/open/user")
    }
    
    init() {
        super.init(tokenType: .loggedUser)
    }
}
