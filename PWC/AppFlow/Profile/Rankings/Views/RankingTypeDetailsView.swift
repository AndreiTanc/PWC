//
//  RankingTypeDetailsView.swift
//  PWC
//
//  Created by Andrei Tanc on 15.08.2022.
//

import SwiftUI

struct RankingTypeDetailsView: View {
    @Binding var shouldCountinueShowingView: Bool
    @State var rankedUsers: [UserRankingDetails]
    var rankingType: RankingType
    var rank: Int
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Button {
                    shouldCountinueShowingView = false
                } label: {
                    Image("BlackBack").padding(.trailing, 5)
                }
                
                VStack {
                    Text("You are on the")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                    Text("\(rank)")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.init(uiColor: .yellowBackground))
                    Text(rankingType.lowerText)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                }.frame(maxWidth: .infinity)
                .background(Color(uiColor: .lighterGray))
                
                Text("You need another 20 points to overtake the 3rd place occupant and 100 points to reach the 1st place. Time is not wasted!")
                    .font(.footnote)
                    .fontWeight(.light)
                    .padding(.bottom, 5)
            }.padding([.leading, .trailing], .generalPadding)
            
            ForEach(rankedUsers, id: \.name) { user in
                VStack {
                    HStack {
                        Text("\(user.place)")
                            .fontWeight(.bold)
                            .font(.system(size: (user.place == 1 || user.place == 2) ? 24 : 20))
                            .foregroundColor((user.place == 1 || user.place == 2) ? Color(uiColor: .orangeButton) : .black)
                        
                        Text(user.name)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("\(user.points)")
                            .fontWeight(.thin)
                    }
                    
                    SeparatorView()
                }.padding([.leading, .trailing, .top])
                
            }
        }
    }
    
    var rankingList: some View {
        VStack {
            Text(rankingType.title)
                .fontWeight(.semibold)
            SeparatorView()
                .padding(.bottom, 2)
        }
    }
}

struct RankingTypeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RankingTypeDetailsView(shouldCountinueShowingView: .constant(false), rankedUsers: [], rankingType: .department, rank: 12)
    }
}
