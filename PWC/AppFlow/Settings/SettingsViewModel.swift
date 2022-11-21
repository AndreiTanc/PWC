//
//  SettingsViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 17.08.2022.
//

import Foundation

class SettingsViewModel: ViewModel {
    
}

extension SettingsViewModel {
    static var mock: SettingsViewModel {
        return .init(router: .mock)
    }
}
