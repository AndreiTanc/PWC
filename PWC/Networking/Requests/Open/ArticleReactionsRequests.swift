//
//  ArticleReactionsRequests.swift
//  PWC
//
//  Created by Andrei Tanc on 27.07.2022.
//

import Foundation

class ReactToArticleRequest: JWTRequest<ArticleReponse> {
    let articleUUID: String
    let reactionType: ReactionType
    
    init(articleUUID: String, reactionType: ReactionType) {
        self.articleUUID = articleUUID
        self.reactionType = reactionType
        super.init(tokenType: .loggedUser)
    }
    
    public override var method: ApiMethod {
        return .post("/api/v1/open/articles/\(articleUUID)/\(reactionType.rawValue)")
    }
}
