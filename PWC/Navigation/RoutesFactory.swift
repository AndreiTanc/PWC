//
//  RoutesFactory.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import SwiftUI

struct RoutesFactory {}

private typealias RoutesFactoryViews = RoutesFactory
extension RoutesFactoryViews {
    static func landingRootView(router: Router) -> some View {
        LandingView(viewModel: LandingViewModel(router: router))
    }
    
    static func loginRouteView(router: Router) -> some View {
        LoginView(viewModel: LoginViewModel(router: router))
    }
    
    static func pwcRouteView(router: Router) -> some View {
        MainContainerView(viewModel: .init(router: router))
    }
    
    static func registerRouteView(router: Router) -> some View {
        RegisterView(viewModel: RegisterViewModel(router: router))
    }
}

private typealias RoutesFactoryViewControllers = RoutesFactory
extension RoutesFactoryViewControllers {
    static func landingRootViewController(router: Router) -> UIViewController {
        UIHostingController(rootView: LandingView(viewModel: LandingViewModel(router: router)))
    }
    
    static func loginViewController(router: Router, screenForGoingBack: LoginViewModel.ScreenForGoingBack = .none) -> UIViewController {
        UIHostingController(rootView: LoginView(viewModel: LoginViewModel(router: router, screenForGoingBack: screenForGoingBack)))
    }
    
    static func registerViewController(router: Router) -> UIViewController {
        UIHostingController(rootView: RegisterView(viewModel: RegisterViewModel(router: router)))
    }
    
    static func homeViewController(router: Router) -> UIViewController {
        UIHostingController(rootView: HomeView(viewModel: HomeViewModel(router: router)))
    }
    
    static func jobDetailsViewController(router: Router, job: Job) -> UIViewController {
        UIHostingController(rootView: JobDetailsView(viewModel: .init(router: router, job: job)))
    }
    
    static func jobApplicationViewContorller(router: Router, job: Job) -> UIViewController {
        UIHostingController(rootView: JobApplicationView(viewModel: .init(router: router, job: job)))
    }
    
    static func articleDetailsViewController(router: Router, article: Article) -> UIViewController {
        UIHostingController(rootView: ArticleDetailsView(viewModel: .init(article: article, router: router)))
    }
    
    static func createPostViewController(router: Router) -> UIViewController {
        UIHostingController(rootView: CreatePostView(viewModel: .init(router: router)))
    }
    
    static func profileViewController(router: Router) -> UIViewController {
        UIHostingController(rootView: ProfileView(viewModel: .init(router: router)))
    }
    
    static func rewardsViewController(router: Router) -> UIViewController {
        UIHostingController(rootView: RewardsView(viewModel: .init(router: router)))
    }
    
    static func improvementIdeaDetailsViewController(router: Router) -> UIViewController {
        UIHostingController(rootView: ImprovementIdeaDetailsView(viewModel: .init(router: router)))
    }
    
    static func settingsViewController(router: Router) -> UIViewController {
        UIHostingController(rootView: SettingsView(viewModel: .init(router: router)))
    }

    static func pointHistory(router: Router) -> UIViewController {
        UIHostingController(rootView: PointsHistoryLogView(viewModel: .init(router: router)))
    }
}
