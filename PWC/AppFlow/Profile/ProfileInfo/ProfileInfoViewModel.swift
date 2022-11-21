//
//  ProfileInfoViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 20.07.2022.
//

import Foundation

class ProfileInfoViewModel: ViewModel {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var hiringDate: String = ""
    @Published var position: String = ""
    @Published var isGDPRChecked: Bool = false
    @Published var isOtherChecked: Bool = false
    
    func handleOnAppear() {
        guard let user = AppUserDefaults.user else { return }
        
        name = user.name ?? ""
        email = user.email ?? ""
        hiringDate = user.hiringDate ?? ""
        position = user.position ?? ""
        isGDPRChecked = user.gdprAccepted ?? false
        isOtherChecked = user.legalAccepted ?? false
    }
    
    func goToSettings() {
        router.push(
            viewController: RoutesFactory.settingsViewController(
                router: router
            )
        )
    }
}

extension ProfileInfoViewModel {
    static var mock: ProfileInfoViewModel {
        return .init(router: .mock)
    }
}
