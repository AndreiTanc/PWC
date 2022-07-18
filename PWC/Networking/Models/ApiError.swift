//
//  ApiError.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

public class ApiError: NSObject, Error, Decodable {
    public let fieldErrors: [FieldError]
    public let globalErrors: [GlobalError]
    
    public var wasIntercepted: Bool! = false
    
    public init(error: Error) {
        fieldErrors = []
        globalErrors = [GlobalError(error: error)]
    }
    
    public init(fieldErrors: [FieldError] = [], globalErrors: [GlobalError] = []) {
        self.fieldErrors = fieldErrors
        self.globalErrors = globalErrors
    }
    
    public convenience init(message: String, code: Int = -1) {
        let global = GlobalError(message: message, code: code)
        self.init(globalErrors: [global])
    }
    
    public override var description: String {
        return """
            FieldErrors:
                \(fieldErrors)
            GlobalErrors:
                \(globalErrors)
        """
    }
}

public struct FieldError: Decodable {
    public let field: String
    public let message: String
    
    public init(field: String, message: String) {
        self.field = field
        self.message = message
    }
}

public struct GlobalError: Decodable {
    public let field: String
    public let message: String
    public let code: Int?
    
    init(error: Error) {
        self.field = ApiError.globalField
        let code = (error as NSError).code
        self.code = code
        let message = error.localizedDescription
        self.message = message + " Code: \(code)"
    }
    
    init(message: String, code: Int = -1) {
        self.field = ApiError.globalField
        self.code = code
        self.message = message
    }
}

public enum FieldType: String {
    case email
    case password
}

extension ApiError {
    public static let globalField = "GLOBAL"
    public static let subscriptionExpiredField = "SUBSCRIPTION_EXPIRED"
}
