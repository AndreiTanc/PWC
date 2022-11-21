//
//  SocialNetworkHeaderView.swift
//  PWC
//
//  Created by Andrei Tanc on 20.07.2022.
//

import SwiftUI

struct SocialNetworkHeaderView: View {
    var userImage: UIImage
    var handleOnRewardsButtonPressed: () -> Void
    var handleOnProfileButtonPressed: () -> Void
    
    var body: some View {
        HStack {
            userInfoView
            rewardsButton
        }.padding()
    }
    
    var userInfoView: some View {
        HStack {
            Image(uiImage: userImage)
                .resizable()
                .frame(width: 50, height: 50)
                .padding(5)
            
            Text("+you")
                .fontWeight(.heavy)
                .font(.system(size: 30))
                .padding(5)
            
            VStack(spacing: 0) {
                Text("259")
                    .fontWeight(.heavy)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .padding(.top, 5)
                
                Text("total points")
                    .font(.footnote)
                    .fontWeight(.light)
                    .padding(.top, -10)
            }.padding(5)
            
        }.frame(maxWidth: .infinity)
        .background(Color(uiColor: .yellowBackground))
        .onTapGesture {
            handleOnProfileButtonPressed()
        }
    }
    
    var rewardsButton: some View {
        Button {
            handleOnRewardsButtonPressed()
        } label: {
            VStack(spacing: 3) {
                Image("DiamondRewards")
                Text("Rewards")
                    .foregroundColor(.white)
            }.padding(5).frame(maxHeight: .infinity).background(Color(uiColor: .red))
        }
    }
}

struct SocialNetworkHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SocialNetworkHeaderView(userImage: UIImage(),
                                handleOnRewardsButtonPressed: {},
                                handleOnProfileButtonPressed: {})
    }
}
