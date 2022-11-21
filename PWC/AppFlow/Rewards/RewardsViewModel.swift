//
//  RewardsViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 12.08.2022.
//

import Foundation

class RewardsViewModel: ViewModel {
    
}

extension RewardsViewModel {
    static var mock: RewardsViewModel {
        return .init(router: .mock)
    }
}
