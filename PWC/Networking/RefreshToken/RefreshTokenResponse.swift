//
//  RefreshTokenResponse.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

struct RefreshTokenResponse: Response {
    public let token: String
    public let refreshToken: String
}
