//
//  ApiMethod.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

public enum ApiMethod {
    case get(String)
    case post(String)
    case put(String)
    case delete(String)
    
    public func getUri(base: String) -> String {
        switch self {
        case .get(let uri), .post(let uri), .put(let uri), .delete(let uri):
            return base + uri
        }
    }
}
