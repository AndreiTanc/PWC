//
//  MainContainerViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 12.08.2022.
//

import Foundation

class MainContainerViewModel: ViewModel {
    func logout() {
        let request = ClosedLogOutRequest()
        
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
}

extension MainContainerViewModel {
    static var mock: MainContainerViewModel {
        return .init(router: .mock)
    }
}
