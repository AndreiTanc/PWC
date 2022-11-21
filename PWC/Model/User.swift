//
//  User.swift
//  PWC
//
//  Created by Andrei Tanc on 27.07.2022.
//

import Foundation

struct User: Codable {
    var name: String?
    var email: String?
    var avatar: String?
    var birthdate: String?
    
    var position: String?
    var hiringDate: String?
    var timeExchange: TimeExchange?
    var isManager: Bool?
    var jobTitle: String?
    var lineOfService: String?
    var department: String?
    
    var isPWC: Bool?
    var mustChangePassword: Bool?
    var availablePoints: Int?
    var totalPoints: Int?
    var spentPoints: Int?
    var pointsToday: Int?
    
    var gdprAccepted: Bool?
    var legalAccepted: Bool?
    
    private enum CodingKeys : String, CodingKey {
        case name, email, avatar, birthdate, position, department
        case hiringDate = "hiring_date"
        case availablePoints = "points_available"
        case totalPoints = "points_total"
        case spentPoints = "points_spent"
        case pointsToday = "points_today"
        case mustChangePassword = "must_change_password"
        case isPWC = "is_pwc"
        case timeExchange = "time_exchange"
        case isManager = "is_manager"
        case jobTitle = "job_title"
        case gdprAccepted = "gdpr_accepted"
        case lineOfService = "line_of_service"
        case legalAccepted = "legal_accepted"
    }
}

struct TimeExchange: Codable {
    var day: String?
    var time: String?
    var isRecurrent: Bool?
    
    private enum CodingKeys : String, CodingKey {
        case day, time
        case isRecurrent = "is_recurrent"
    }
}
