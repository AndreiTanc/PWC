//
//  PointLog.swift
//  PWC
//
//  Created by Andrei Tanc on 29.08.2022.
//

import Foundation

struct PointLog: Codable {
    var uuid: Int
    var isBonus: Bool
    var points: Int
    var comment: String?
    var date: String?
    
    private enum CodingKeys : String, CodingKey {
        case uuid, points, comment, date
        case isBonus = "is_bonus"
    }
}
