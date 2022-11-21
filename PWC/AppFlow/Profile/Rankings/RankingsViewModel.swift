//
//  RankingsViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 13.08.2022.
//

import Foundation

class RankingsViewModel: ViewModel {
    @Published var shouldShowDetails = false
    @Published var rankingsTypeDetailsToBeShown: RankingType = .department
    
    @Published var companyRanking: Int = 0
    @Published var lineOfServiceRanking: Int = 0
    @Published var departmentRanking: Int = 0
    
    @Published var companyUserRankings: [UserRankingDetails] = []
    @Published var lineOfServiceUserRankings: [UserRankingDetails] = []
    @Published var departmentUserRankings: [UserRankingDetails] = []
    
    func handleOnAppear() {
        let request = RankingsRequest()
        
        router.networking.call(request: request) { [weak self] response in
            self?.companyRanking = response.data.companyRankings.value
            self?.lineOfServiceRanking = response.data.lineOfServiceRankings.value
            self?.departmentRanking = response.data.departmentRankings.value
        } onError: { error in
            print(error)
        }
        
        getRankingsDetails()
    }
    
    private func getRankingsDetails() {
        let categoriesArray = ["company", "line-of-service", "department"]
        let group = DispatchGroup()
        
        categoriesArray.forEach { category in
            group.enter()
            
            let request = CategoryRankingDetailsRequest(category: "company")
            
            router.networking.call(request: request) { [weak self] response in
                if category == "company" {
                    self?.companyUserRankings = response.data.rankings
                } else if category == "department" {
                    self?.departmentUserRankings = response.data.rankings
                } else {
                    self?.lineOfServiceUserRankings = response.data.rankings
                }
                group.leave()
            } onError: { error in
                print(error)
                group.leave()
            }
        }
    }
    
    func getRankedUsersForSelectedCategory() -> [UserRankingDetails] {
        switch rankingsTypeDetailsToBeShown {
        case .department:
            return departmentUserRankings
        case .lineOfService:
            return lineOfServiceUserRankings
        case .company:
            return companyUserRankings
        }
    }
    
    func getRankForSelectedCategory() -> Int {
        switch rankingsTypeDetailsToBeShown {
        case .department:
            return departmentRanking
        case .lineOfService:
            return lineOfServiceRanking
        case .company:
            return companyRanking
        }
    }
}

extension RankingsViewModel {
    static var mock: RankingsViewModel {
        return .init(router: .mock)
    }
}
