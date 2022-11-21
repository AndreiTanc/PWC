//
//  MainContainerView.swift
//  PWC
//
//  Created by Andrei Tanc on 12.08.2022.
//

import SwiftUI

struct MainContainerView: View {
    @ObservedObject var viewModel: MainContainerViewModel
    @State private var selection = 0

    var handler: Binding<Int> { Binding(
        get: { self.selection },
        set: {
            if $0 == 1 {
                viewModel.logout()
                return
            }
            self.selection = $0
        }
    )}
    
    var body: some View {
        NavBarHiddenView {
            content
        }
    }
    
    var content: some View {
        TabView(selection: handler) {
            SocialNetworkView(viewModel: .init(router: viewModel.router))
                .tabItem {
                    VStack {
                        Image("TabSocial")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                        Text("Home")
                    }
                }.tag(0)
            
            Text("Logout")
                .tabItem {
                    VStack {
                        Image("TabProfile")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                        Text("LogOut")
                    }
                }.tag(1)
            
            Text("chat")
                .tabItem {
                    VStack {
                        Image("TabChat")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                        Text("Chats")
                    }
                }.tag(2)
            
            RewardsView(viewModel: .init(router: viewModel.router))
                .tabItem {
                    VStack {
                        Image("TabRewards")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                        Text("Rewards")
                    }
                }.tag(3)
            
            Text("Timeexc")
                .tabItem {
                    VStack {
                        Image("TabTime")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                        Text("Time Exc.")
                    }
                }.tag(4)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct MainContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MainContainerView(viewModel: .mock)
    }
}
