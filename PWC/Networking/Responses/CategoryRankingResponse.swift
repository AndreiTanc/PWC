//
//  CategoryRankingDetailsResponse.swift
//  PWC
//
//  Created by Andrei Tanc on 26.08.2022.
//

import Foundation

struct CategoryRankingResponse: Response {
    var data: CategoryRankingDetails
}

struct CategoryRankingDetails: Codable {
    var rankings: [UserRankingDetails]
}

struct UserRankingDetails: Codable {
    var place: Int
    var name: String
    var points: Int
}
