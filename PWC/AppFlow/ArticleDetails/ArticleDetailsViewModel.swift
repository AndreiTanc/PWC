//
//  ArticleDetailsViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 22.07.2022.
//

import Foundation

class ArticleDetailsViewModel: ViewModel {
    @Published var article: Article
    
    var commentsButtonTitle: String {
        let commentString = article.comments == 1 ? "comment" : "comments"
        return "\(article.comments) \(commentString)"
    }
    
    init(article: Article, router: Router) {
        self.article = article
        super.init(router: router)
    }
    
    func handleOnCommentsButtonTapped() {
        if AppUserDefaults.passwordToken == nil {
            goToLogin()
            return
        }
        
        goToComments()
    }
    
    func handleOnReactionButtonPressed(_ reactionType: ReactionType) {
        if AppUserDefaults.passwordToken == nil {
            goToLogin()
            return
        }
        
        let request = ReactToArticleRequest(articleUUID: article.uuid, reactionType: reactionType)
        router.networking.call(request: request) { [weak self] response in
            self?.handleSucc(forReactionType: reactionType)
        } onError: { error in
            print(error)
        }
    }
    
    private func handleSucc(forReactionType reactionType: ReactionType) {
        switch reactionType {
        case .like:
            article.reactions.like += 1
        case .love:
            article.reactions.love += 1
        case .dislike:
            article.reactions.thumbsDown += 1
        }
    }
    
    func goToLogin() {
        router.push(
            viewController: RoutesFactory.loginViewController(
                router: router,
                screenForGoingBack: .articleDetails
            )
        )
    }
    
    func goToComments() {
        
    }
}

extension ArticleDetailsViewModel {
    static var mock: ArticleDetailsViewModel {
        return .init(article: .init(uuid: "", title: "", category: .events, body: "", cover: "", reactions: .init(like: 1, love: 1, thumbsDown: 1), comments: 1), router: .mock)
    }
}
