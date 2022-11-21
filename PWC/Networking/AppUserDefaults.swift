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
    
    @UserDefault(key: "openClientToken") static var openClientToken: String?
    @UserDefault(key: "passwordToken") static var passwordToken: String?
    @UserDefault(key: "user") static var userData: Data?
    
    @UserDefault(key: "isDarkMode") static var isDarkMode: Bool?
    
    static var user: User? {
        get {
            return try? JSONDecoder().decode(User.self, from: userData ?? Data())
        }
        set {
            if let newValue = newValue {
                userData = try? JSONEncoder().encode(newValue)
            } else {
                userData = nil
            }
        }
    }
    
    static var isPWC: Bool {
        user?.isPWC ?? false
    }
    
    static func isDarkModeEnabled() -> Bool {
        return isDarkMode ?? false
    }
}
