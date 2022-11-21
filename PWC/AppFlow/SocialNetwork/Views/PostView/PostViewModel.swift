//
//  PostViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 10.08.2022.
//

import Foundation

class PostViewModel: ViewModel {
    @Published var postData: Post
    var hasComments: Bool = false
    var hasReactions: Bool = false
    
    var commentsButtonTitle: String {
        let commentString = postData.comments == 1 ? "comment" : "comments"
        return "\(postData.comments) \(commentString)"
    }
    
    init(post: Post, router: Router) {
        self.postData = post
        super.init(router: router)
    }
    
    func handleOnReactionButtonPressed(_ reactionType: ReactionType) {
        
    }
}

extension PostViewModel {
    static var mock: PostViewModel {
        return .init(post: .init(uuid: "", user: .init(name: "", avatar: ""),
                                 category: .iCareAbout, date: "", title: "", body: "",
                                 reactions: .init(like: 1, love: 1, thumbsDown: 1), comments: 1),
                     router: .mock)
    }
}
