//
//  PointsView.swift
//  PWC
//
//  Created by Andrei Tanc on 28.07.2022.
//

import SwiftUI

struct PointsView: View {
    @ObservedObject var viewModel: PointsViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            VStack(spacing: 2) {
                Text("\(viewModel.availablePoints)")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                Text("available points")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }.frame(width: UIScreen.main.bounds.size.width*2/3, height: 130)
            .border(Color.gray, width: 1)
            
            
            VStack(spacing: 0) {
                Text("\(viewModel.totalPoints)")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                Text("total earned points")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }.frame(width: UIScreen.main.bounds.size.width*2/3, height: 130)
            .border(Color.gray, width: 1)
            
            Spacer()
            
            Button {
                viewModel.handleOnPointsHirtoryButtonTapped()
            } label: {
                Text("POINTS HISTORY LOG")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }.padding()
            .frame(width: UIScreen.main.bounds.size.width*2/3)
            .background(Color(uiColor: .yellowBackground))

            Button {
                viewModel.handleOnRewardsHistoryButtonTapped()
            } label: {
                Text("REWARDS HISTORY LOG")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }.padding()
            .frame(width: UIScreen.main.bounds.size.width*2/3)
            .background(Color(uiColor: .yellowBackground))
        }
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(viewModel: .mock)
    }
}
