//
//  LandingViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

class LandingViewModel: ViewModel {
    
}

extension LandingViewModel {
    static var mock: LandingViewModel {
        return .init(router: .mock)
    }
}
