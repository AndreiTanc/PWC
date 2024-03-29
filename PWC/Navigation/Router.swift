//
//  Router.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import SwiftUI

class Router {
    var window: UIWindow
    private (set) var networking: Networking
    
    private var navigationController: UINavigationController?
    private var rootType: Any.Type?
    
    init(window: UIWindow) {
        self.window = window
        
        self.networking = AlamofireNetworking(config: .init(baseUri: Constants.Url.base.rawValue))
    }
    
    func push(viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func popViewController(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    func popToControllerHosting<CustomView: View>(viewType: CustomView.Type, animated: Bool = true) {
        guard let viewControllers = navigationController?.viewControllers else { return }
        
        if let target = viewControllers.first(where: { $0 is UIHostingController<CustomView> }) {
            self.navigationController?.popToViewController(target, animated: animated)
        } else {
            self.navigationController?.popToRootViewController(animated: animated)
        }
    }
    
    func popToRootViewController(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    func present(viewController: UIViewController, animated: Bool = true, modalPresentationStyle: UIModalPresentationStyle = .overCurrentContext) {
        navigationController?.modalPresentationStyle = modalPresentationStyle
        navigationController?.present(viewController, animated: animated)
    }
}

private typealias RoutersRoots = Router
extension RoutersRoots {
    func instantiateLandingRouting() {
        let landingView = RoutesFactory.landingRootView(router: self)
        let rootView = RootNavigationView {
            landingView
        } navigationControllerProxy: { navigationController in
            self.navigationController = navigationController
        }
        
        self.window.rootViewController = nil
        self.window.rootViewController = UIHostingController(rootView: rootView)
    }
    
    func instantiateOnboardingRouting() {
        let loginView = RoutesFactory.loginRouteView(router: self)
        let rootView = RootNavigationView {
            loginView
        } navigationControllerProxy: { navigationController in
            self.navigationController = navigationController
        }
        
        self.window.rootViewController = nil
        self.window.rootViewController = UIHostingController(rootView: rootView)
    }
    
    func instantiatePWCRouting() {
        let mainContainer = RoutesFactory.pwcRouteView(router: self)
        let rootView = RootNavigationView {
            mainContainer
        } navigationControllerProxy: { navigationController in
            self.navigationController = navigationController
        }
        
        self.window.rootViewController = nil
        self.window.rootViewController = UIHostingController(rootView: rootView)
    }
}

extension Router {
    static var mock: Router {
        return Router(window: UIWindow())
    }
}
