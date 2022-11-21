//
//  ArticleViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 28.07.2022.
//

import Foundation

class ArticleViewModel: ViewModel {
    @Published var article: Article
    
    init(router: Router, article: Article) {
        self.article = article
        super.init(router: router)
    }
    
    func handleOnReactionButtonPressed(_ reactionType: ReactionType) {
        if AppUserDefaults.passwordToken == nil {
            goToLogin()
            return
        }
        
        let request = ReactToArticleRequest(articleUUID: article.uuid, reactionType: reactionType)
        router.networking.call(request: request) { [weak self] response in
            self?.article = response.data
        } onError: { error in
            print(error)
        }
    }
        
    func goToLogin() {
        router.push(
            viewController: RoutesFactory.loginViewController(
                router: router,
                screenForGoingBack: .home
            )
        )
    }
}

extension ArticleViewModel {
    static var mock: ArticleViewModel {
        return .init(router: .mock, article: .init(uuid: "", title: "", category: .news, body: "", cover: "", reactions: .init(like: 1, love: 1, thumbsDown: 1), comments: 2))
    }
}
