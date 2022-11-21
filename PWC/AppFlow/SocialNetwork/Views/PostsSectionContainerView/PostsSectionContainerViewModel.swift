//
//  PostsSectionContainerViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 24.08.2022.
//

import Foundation

class PostsSectionContainerViewModel: ViewModel {
    var title: String
    @Published var posts: [Post]
    
    init(title: String, posts: [Post], router: Router) {
        self.title = title
        self.posts = posts
        super.init(router: router)
    }
}
