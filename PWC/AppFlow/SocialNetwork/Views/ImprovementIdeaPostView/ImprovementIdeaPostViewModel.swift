//
//  ImprovementIdeaPostViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 15.08.2022.
//

import Foundation

class ImprovementIdeaPostViewModel: ViewModel {
    func goToDetails() {
        router.push(
            viewController: RoutesFactory.improvementIdeaDetailsViewController(
                router: router
            )
        )
    }
}

extension ImprovementIdeaPostViewModel {
    static var mock: ImprovementIdeaPostViewModel {
        return .init(router: .mock)
    }
}
