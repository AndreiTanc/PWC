//
//  LandingViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

class LandingViewModel: ViewModel {
    func handleOnAppear() {
        if AppUserDefaults.openClientToken == nil {
            getOpenAccessTokenAndNavigateToHome()
            return
        }
        
//        AppUserDefaults.passwordToken = nil
//        AppUserDefaults.user = nil
        
        if AppUserDefaults.user != nil && !AppUserDefaults.isPWC {
            router.instantiatePWCRouting()
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.router.push(viewController: RoutesFactory.homeViewController(router: self.router))
        }
    }
    
    private func getOpenAccessTokenAndNavigateToHome() {
        let request = OpenClientTokenRequest()
        
        router.networking.call(request: request) { [weak self] response in
            guard let self = self else { return }
            
            AppUserDefaults.openClientToken = response.accessToken
            self.router.push(viewController: RoutesFactory.homeViewController(router: self.router))
        } onError: { error in
            print(error)
        }
    }
}

extension LandingViewModel {
    static var mock: LandingViewModel {
        return .init(router: .mock)
    }
}
