//
//  PointsViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 28.07.2022.
//

import Foundation

class PointsViewModel: ViewModel {
    
    var availablePoints: Int {
        AppUserDefaults.user?.availablePoints ?? 0
    }
    
    var totalPoints: Int {
        AppUserDefaults.user?.totalPoints ?? 0
    }
    
    func handleOnPointsHirtoryButtonTapped() {
        router.push(
            viewController: RoutesFactory.pointHistory(
                router: router
            )
        )
    }
    
    func handleOnRewardsHistoryButtonTapped() {
        
    }
}

extension PointsViewModel {
    static var mock: PointsViewModel {
        return .init(router: .mock)
    }
}
