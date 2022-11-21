//
//  GetPostsRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 24.08.2022.
//

import Foundation

class GetPostsRequest: JWTRequest<GetPostsResponse> {
    private let postCategory: PostCategory
    
    public override var method: ApiMethod {
        switch postCategory {
        case .iCareAbout:
            return .get("/api/v1/closed/social/i-care-about")
        case .helpRequest:
            return .get("/api/v1/closed/social/help-request")
        case .announcement, .improvementIdeas:
            return .get("/api/v1/closed/social/announcements")
        }
    }
    
    init(category: PostCategory) {
        self.postCategory = category
        super.init(tokenType: .loggedUser)
    }
}
