//
//  HomeViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 19.07.2022.
//

import Foundation

class HomeViewModel: ViewModel {
    @Published var news: [Article] = []
    @Published var jobs: [Job] = []
    @Published var events: [Article] = []
    
    @Published var isLoggedIn: Bool = false
    
    func handleOnAppear() {
        if news.isEmpty {
            getArticleNews()
            getArticleEvents()
            getJobs()
        }
        
        checkIfIsLoggedIn()
    }
    
    private func getArticleNews() {
        let request = ArticleNewsRequest()
        
        router.networking.call(request: request) { [weak self] response in
            self?.news = response.data
        } onError: { error in
            print(error)
        }
    }
    
    private func getArticleEvents() {
        let request = ArticleEventsRequest()
        
        router.networking.call(request: request) { [weak self] response in
            self?.events = response.data
        } onError: { error in
            print(error)
        }
    }
    
    private func getJobs() {
        let request = JobsRequest()
        
        router.networking.call(request: request) { [weak self] response in
            self?.jobs = response.data
        } onError: { error in
            print(error)
        }
    }
    
    func logout() {
        let request = OpenLogOutRequest()
        
        router.networking.call(request: request) { [weak self] response in
            self?.handleOnSuccessfulLogOut()
        } onError: { error in
            print(error)
        }
    }
    
    private func handleOnSuccessfulLogOut() {
        AppUserDefaults.user = nil
        AppUserDefaults.passwordToken = nil
        
        router.instantiateLandingRouting()
    }
    
    func checkIfIsLoggedIn() {
        isLoggedIn = AppUserDefaults.passwordToken != nil
    }
    
    func goToRegister() {
        router.push(
            viewController: RoutesFactory.registerViewController(
                router: router
            )
        )
    }
    
    func goToLogin() {
        router.push(
            viewController: RoutesFactory.loginViewController(
                router: router
            )
        )
    }
    
    func goToJobDetails(_ job: Job) {
        router.push(
            viewController: RoutesFactory.jobDetailsViewController(
                router: router, job: job
            )
        )
    }
    
    func goToArticleDetails(_ article: Article) {
        router.push(
            viewController: RoutesFactory.articleDetailsViewController(
                router: router, article: article
            )
        )
    }
}

extension HomeViewModel {
    static var mock: HomeViewModel {
        return .init(router: .mock)
    }
}
