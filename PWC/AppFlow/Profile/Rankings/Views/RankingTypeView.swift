//
//  RankingTypeView.swift
//  PWC
//
//  Created by Andrei Tanc on 15.08.2022.
//

import SwiftUI

enum RankingType: String {
    case department = "Department"
    case lineOfService = "Line of Service"
    case company = "Company"
    
    var lowerText: String {
        return "place on your " + self.rawValue.lowercased()
    }
    
    var title: String {
        return self.rawValue + " Rankings"
    }
}

struct RankingTypeView: View {
    var rankingType: RankingType = .department
    var rank: Int = 0
    
    var handleOnTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(rankingType.title)
                .fontWeight(.semibold)
            SeparatorView()
                .padding(.bottom, 2)
            
            HStack(spacing: 2) {
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
                
                Image(systemName: "arrowtriangle.right.fill")
                    .padding()
                    .frame(maxHeight: .infinity)
                    .background(Color.init(uiColor: .yellowBackground))
                    .foregroundColor(.white)
                    .onTapGesture {
                        handleOnTap()
                    }
            }.frame(maxWidth: .infinity)
        }.padding([.leading, .trailing], .generalPadding)
    }
}

struct RankingTypeView_Previews: PreviewProvider {
    static var previews: some View {
        RankingTypeView(handleOnTap: {})
    }
}
