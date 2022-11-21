//
//  UserDefaults.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation
import Combine

@propertyWrapper
struct UserDefault<T: PropertyListValue> {
    let key: Key
    
    var wrappedValue: T? {
        get { UserDefaults.standard.value(forKey: key.rawValue) as? T }
        set { UserDefaults.standard.set(newValue, forKey: key.rawValue) }
    }
}

struct Key: RawRepresentable {
    let rawValue: String
}

extension Key: ExpressibleByStringLiteral {
    init(stringLiteral: String) {
        rawValue = stringLiteral
    }
}

extension Key {
    static let isFirstLaunch: Key = "isFirstLaunch"
}

protocol PropertyListValue {}

extension Data: PropertyListValue {}
extension String: PropertyListValue {}
extension Date: PropertyListValue {}
extension Bool: PropertyListValue {}
extension Int: PropertyListValue {}
extension Double: PropertyListValue {}
extension Float: PropertyListValue {}
extension User: PropertyListValue {}

// Every element must be a property-list type
extension Array: PropertyListValue where Element: PropertyListValue {}
extension Dictionary: PropertyListValue where Key == String, Value: PropertyListValue {}

extension UserDefaults {
    @objc dynamic var status: String {
        get { string(forKey: "darkModeStatus") ?? "Automatic" }
        set { setValue(newValue, forKey: "darkModeStatus") }
    }
}
