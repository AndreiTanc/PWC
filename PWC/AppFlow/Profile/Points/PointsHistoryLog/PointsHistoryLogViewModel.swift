//
//  PointsHistoryLogViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 29.08.2022.
//

import Foundation

class PointsHistoryLogViewModel: ViewModel {
    @Published var pointLogs: [PointLog] = []
    
    func handleOnAppear() {
        let request = PointsRequest()
        
        router.networking.call(request: request) { [weak self] response in
            self?.pointLogs = response.data
        } onError: { error in
            print(error)
        }

    }
}

extension PointsHistoryLogViewModel {
    static var mock: PointsHistoryLogViewModel {
        return .init(router: .mock)
    }
}
