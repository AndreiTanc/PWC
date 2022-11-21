//
//  ImprovementIdeaDetailsViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 15.08.2022.
//

import Foundation

class ImprovementIdeaDetailsViewModel: ViewModel {
    @Published var improvementText: String = ""
    @Published var isCommited: Bool = false
}

extension ImprovementIdeaDetailsViewModel {
    static var mock: ImprovementIdeaDetailsViewModel {
        return .init(router: .mock)
    }
}
