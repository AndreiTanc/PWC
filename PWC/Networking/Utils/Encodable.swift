//
//  Encodable.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

extension Encodable {
    public var json: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
