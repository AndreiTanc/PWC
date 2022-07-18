//
//  RefreshTokenRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

class RefreshTokenRequest: BaseRequest<RefreshTokenResponse> {
    override var method: ApiMethod {
        return .get("auth/refresh-token")
    }

    init(refreshToken: String) {
        super.init(headers: ["Authorization": "Bearer \(refreshToken)"])
    }
}
