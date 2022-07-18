//
//  Data.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

extension Data {
    var prettyPrintedJSONString: String {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: data, encoding: String.Encoding.utf8) else { return "" }

        return prettyPrintedString
    }
}
