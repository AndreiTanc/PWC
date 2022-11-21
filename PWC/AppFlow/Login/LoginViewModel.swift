//
//  LoginViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

class LoginViewModel: ViewModel {
    private var screenForGoingBack: ScreenForGoingBack
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    init(router: Router, screenForGoingBack: ScreenForGoingBack = .none) {
        self.screenForGoingBack = screenForGoingBack
        super.init(router: router)
    }
    
    func goToRegister() {
        router.push(viewController: RoutesFactory.registerViewController(router: router))
    }
    
    func login() {
        if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            
            print("not ok")
            return
        }
        
        let request = OpenPasswordTokenRequest(username: email, password: password)
        router.networking.call(request: request) { [weak self] response in
            print("response issss: ", response)
            AppUserDefaults.passwordToken = response.accessToken
            self?.getUser()
        } onError: { error in
            print(error)
        }
    }
    
    private func getUser() {
        let request = UserRequest()
        
        router.networking.call(request: request) { [weak self] response in
            AppUserDefaults.user = response.data
            self?.handleSuccessfulyLoggedIn()
        } onError: { error in
            AppUserDefaults.passwordToken = nil
            print(error)
        }
    }
    
    private func handleSuccessfulyLoggedIn() {
        if !AppUserDefaults.isPWC {
            router.instantiatePWCRouting()
            return
        }
        
        switch screenForGoingBack {
        case .articleDetails:
            router.popToControllerHosting(viewType: ArticleDetailsView.self)
        case .jobDetails:
            router.popToControllerHosting(viewType: JobDetailsView.self)
        case .home:
            router.popToControllerHosting(viewType: HomeView.self)
        case .none:
            router.popToControllerHosting(viewType: HomeView.self)
        }
    }
}

extension LoginViewModel {
    static var mock: LoginViewModel {
        return .init(router: .mock)
    }
}

extension LoginViewModel {
    enum ScreenForGoingBack {
        case articleDetails
        case jobDetails
        case home
        case none
    }
}
