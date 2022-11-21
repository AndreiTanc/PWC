//
//  SocialNetworkViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 20.07.2022.
//

import Foundation

class SocialNetworkViewModel: ViewModel {
    @Published var iCareAboutPosts: [Post] = []
    @Published var helpRequestPosts: [Post] = []
    @Published var announcementPosts: [Post] = []
    
    func handleOnAppear() {
        getAnnouncementPosts()
        getICareAboutPosts()
        getHelpRequestPosts()
    }
    
    func getICareAboutPosts() {
        let request = GetPostsRequest(category: .iCareAbout)
        
        router.networking.call(request: request) { [weak self] response in
            self?.iCareAboutPosts = response.data
        } onError: { error in
            print(error)
        }
    }
    
    func getHelpRequestPosts() {
        let request = GetPostsRequest(category: .helpRequest)
        
        router.networking.call(request: request) { [weak self] response in
            self?.helpRequestPosts = response.data
        } onError: { error in
            print(error)
        }
    }
    
    func getAnnouncementPosts() {
        let request = GetPostsRequest(category: .announcement)
        
        router.networking.call(request: request) { [weak self] response in
            self?.announcementPosts = response.data
        } onError: { error in
            print(error)
        }
    }
    
    func goToRewards() {
        router.push(
            viewController: RoutesFactory.rewardsViewController(
                router: router
            )
        )
    }
    
    func goToProfile() {
        router.push(
            viewController: RoutesFactory.profileViewController(
                router: router
            )
        )
    }
    
    func presentCreatePostView() {
        router.push(
            viewController: RoutesFactory.createPostViewController(
                router: router
            )
        )
    }
}

extension SocialNetworkViewModel {
    static var mock: SocialNetworkViewModel {
        return .init(router: .mock)
    }
}
