//
//  ProfileView.swift
//  PWC
//
//  Created by Andrei Tanc on 20.07.2022.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        NavBarHiddenView {
            VStack {
                NavBarHeaderView {
                    viewModel.goBack()
                }
                
                VStack {
                    Image("")
                    Text(viewModel.selectedSetting.rawValue.uppercased())
                        .fontWeight(.semibold)
                }
                
                headerView
                
                ScrollView {
                    switch viewModel.selectedSetting {
                    case .profileInfo:
                        ProfileInfoView(viewModel: .init(router: viewModel.router))
                    case .points:
                        PointsView(viewModel: .init(router: viewModel.router))
                    case .rankings:
                        RankingsView(viewModel: .init(router: viewModel.router))
                    case .badges:
                        EmptyView()
                    }
                }
            }
        }.onAppear(perform: viewModel.handleOnAppear)
    }
    
    var headerView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ProfileHeaderSettingView(setting: .profileInfo,
                                         selectedSetting: $viewModel.selectedSetting)
                
                ProfileHeaderSettingView(setting: .points,
                                         selectedSetting: $viewModel.selectedSetting)
                
                ProfileHeaderSettingView(setting: .rankings,
                                         selectedSetting: $viewModel.selectedSetting)
                
                ProfileHeaderSettingView(setting: .badges,
                                         selectedSetting: $viewModel.selectedSetting)
            }
        }.padding([.top, .bottom], .generalPadding)
    }
    
    var content: some View {
        VStack {
            
        }
    }
    
    var profileInfo: some View {
        VStack {
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: .mock)
    }
}
