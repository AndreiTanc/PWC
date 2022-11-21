//
//  CategoryRankingDetailsRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 26.08.2022.
//

import Foundation

class CategoryRankingDetailsRequest: JWTRequest<CategoryRankingResponse> {
    var category: String
    
    public override var method: ApiMethod {
        return .get("/api/v1/closed/rankings/\(category)")
    }
    
    init(category: String) {
        self.category = category
        super.init(tokenType: .loggedUser)
    }
}
