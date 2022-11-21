//
//  RankingsResponse.swift
//  PWC
//
//  Created by Andrei Tanc on 26.08.2022.
//

import Foundation

struct RankingsResponse: Response {
    var data: GeneralRankings
}

struct GeneralRankings: Codable {
    var companyRankings: GeneralRanking
    var lineOfServiceRankings: GeneralRanking
    var departmentRankings: GeneralRanking
    
    private enum CodingKeys: String, CodingKey {
        case companyRankings = "company_ranking"
        case lineOfServiceRankings = "line_of_service_ranking"
        case departmentRankings = "department_ranking"
    }
}

struct GeneralRanking: Codable {
    var value: Int
    
    var small_text: String?
    var after_text: String?
    var pre_text: String?
}
