//
//  ProfileViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 20.07.2022.
//

import Foundation

enum ProfileSetting: String {
    case profileInfo = "profile info"
    case points = "points"
    case rankings = "rankings"
    case badges = "badges"
}

class ProfileViewModel: ViewModel {
    @Published var selectedSetting: ProfileSetting = .profileInfo
    
    func handleOnAppear() {
        getPoints()
    }
    
    private func getPoints() {
        let request = PointsRequest()
        
        router.networking.call(request: request) { response in
            print(response)
        } onError: { error in
            print(error)
        }
    }
}

extension ProfileViewModel {
    static var mock: ProfileViewModel {
        return .init(router: .mock)
    }
}
