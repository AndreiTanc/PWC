//
//  LoginViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

class LoginViewModel: ViewModel {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func goToRegister() {
        router.push(viewController: RoutesFactory.registerViewController(router: router))
    }
}

extension LoginViewModel {
    static var mock: LoginViewModel {
        return .init(router: .mock)
    }
}

