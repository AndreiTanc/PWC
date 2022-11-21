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
    
    func handleOnRegisterTapped() {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            
            print("not ok")
            return
        }
        
        register()
    }
    
    func register() {
        let request = RegisterRequest(model: .init(name: name,
                                                   email: email,
                                                   password: password))
        
        router.networking.call(request: request) { response in
            print(response)
        } onError: { error in
            print(error)
        }
    }
}

extension RegisterViewModel {
    static var mock: RegisterViewModel {
        return .init(router: .mock)
    }
}
