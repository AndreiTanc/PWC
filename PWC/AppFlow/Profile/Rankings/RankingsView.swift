//
//  RankingsView.swift
//  PWC
//
//  Created by Andrei Tanc on 13.08.2022.
//

import SwiftUI

struct RankingsView: View {
    @ObservedObject var viewModel: RankingsViewModel
    
    var body: some View {
        if !viewModel.shouldShowDetails {
            rankingTypesView
        } else {
            rankingTypesDetailsView
        }
    }
    
    var rankingTypesView: some View {
        VStack(alignment: .leading, spacing: 10) {
            RankingTypeView(rankingType: .department, rank: viewModel.departmentRanking) {
                viewModel.rankingsTypeDetailsToBeShown = .department
                viewModel.shouldShowDetails = true
            }
            
            RankingTypeView(rankingType: .lineOfService, rank: viewModel.lineOfServiceRanking) {
                viewModel.rankingsTypeDetailsToBeShown = .lineOfService
                viewModel.shouldShowDetails = true
            }
            divisionExtraText
            
            RankingTypeView(rankingType: .company, rank: viewModel.companyRanking) {
                viewModel.rankingsTypeDetailsToBeShown = .company
                viewModel.shouldShowDetails = true
            }
        }.onAppear(perform: viewModel.handleOnAppear)
    }
    
    var rankingTypesDetailsView: some View {
        RankingTypeDetailsView(shouldCountinueShowingView: $viewModel.shouldShowDetails,
                               rankedUsers: viewModel.getRankedUsersForSelectedCategory(),
                               rankingType: viewModel.rankingsTypeDetailsToBeShown,
                               rank: viewModel.getRankForSelectedCategory())
    }
    
    var divisionExtraText: some View {
        Text("You need another 20 points to overtake the 3rd place occupant and 100 points to reach the 1st place. Time is not wasted!")
            .font(.footnote)
            .fontWeight(.light)
            .padding(.bottom, 5)
            .padding([.leading, .trailing], .generalPadding)
    }
}

struct RankingsView_Previews: PreviewProvider {
    static var previews: some View {
        RankingsView(viewModel: .mock)
    }
}

struct SeparatorView: View {
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 1)
            .foregroundColor(.gray)
            
    }
}
