//
//  RegisterViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

class RegisterViewModel: ViewModel {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    func goToLogin() {
        router.push(viewController: RoutesFactory.loginViewController(router: router))
    }
}

extension RegisterViewModel {
    static var mock: RegisterViewModel {
        return .init(router: .mock)
    }
}
