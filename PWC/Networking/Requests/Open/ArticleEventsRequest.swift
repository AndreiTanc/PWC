//
//  ArticleEventsRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 27.07.2022.
//

import Foundation

class ArticleEventsRequest: JWTRequest<ArticlesReponse> {
    public override var method: ApiMethod {
        return .get("/api/v1/open/articles/events")
    }
}
