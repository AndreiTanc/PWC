//
//  AppUserDefaults.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

public final class AppUserDefaults {
    @UserDefault(key: "token") static var token: String?
    @UserDefault(key: "refreshToken") static var refreshToken: String?
}
