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
    
    static func registerRouteView(router: Router) -> some View {
        RegisterView(viewModel: RegisterViewModel(router: router))
    }
}

private typealias RoutesFactoryViewControllers = RoutesFactory
extension RoutesFactoryViewControllers {
    static func landingRootViewController(router: Router) -> UIViewController {
        UIHostingController(rootView: LandingView(viewModel: LandingViewModel(router: router)))
    }
    
    static func loginViewController(router: Router) -> UIViewController {
        UIHostingController(rootView: LoginView(viewModel: LoginViewModel(router: router)))
    }
    
    static func registerViewController(router: Router) -> UIViewController {
        UIHostingController(rootView: RegisterView(viewModel: RegisterViewModel(router: router)))
    }
}
