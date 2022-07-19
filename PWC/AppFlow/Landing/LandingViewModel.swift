//
//  LandingViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

class LandingViewModel: ViewModel {
    func handleOnAppear() {
//        if AppUserDefaults.token == nil {
//            router.initiateAuthenticationRoute()
//        } else {
//            fetchData()
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.router.push(viewController: RoutesFactory.loginViewController(router: self.router))
        }
    }
}

extension LandingViewModel {
    static var mock: LandingViewModel {
        return .init(router: .mock)
    }
}
