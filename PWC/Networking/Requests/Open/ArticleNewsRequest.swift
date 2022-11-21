//
//  ArticleNewsRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 22.07.2022.
//

import Foundation

class ArticleNewsRequest: JWTRequest<ArticlesReponse> {
    public override var method: ApiMethod {
        return .get("/api/v1/open/articles/news")
    }
}
