//
//  SocialNetworkView.swift
//  PWC
//
//  Created by Andrei Tanc on 20.07.2022.
//

import SwiftUI

struct SocialNetworkView: View {
    @ObservedObject var viewModel: SocialNetworkViewModel
    
    var body: some View {
        NavBarHiddenView {
            content
        }
    }
    
    var content: some View {
        ScrollView {
            LazyVStack {
                SocialNetworkHeaderView(userImage: UIImage(named: "LandingTopImage") ?? UIImage(),
                                        handleOnRewardsButtonPressed: {
                    viewModel.goToRewards()
                }, handleOnProfileButtonPressed: {
                    viewModel.goToProfile()
                }).frame(maxWidth: .infinity)
                
                createNewPostView
                
                if !viewModel.announcementPosts.isEmpty {
                    PostsSectionContainerView(viewModel: .init(title: "Announcements",
                                                               posts: viewModel.announcementPosts,
                                                               router: viewModel.router))
                    .frame(height: 450)
                }
                
                if !viewModel.iCareAboutPosts.isEmpty {
                    PostsSectionContainerView(viewModel: .init(title: "I care about",
                                                               posts: viewModel.iCareAboutPosts,
                                                               router: viewModel.router))
                    .frame(height: 450)
                }
                
                if !viewModel.helpRequestPosts.isEmpty {
                    PostsSectionContainerView(viewModel: .init(title: "Help requests",
                                                               posts: viewModel.helpRequestPosts,
                                                               router: viewModel.router))
                    .frame(height: 450)
                }
                
                ImprovementIdeaPostView(viewModel: .init(router: viewModel.router))
            }.frame(maxWidth: .infinity)
        }.onAppear(perform: viewModel.handleOnAppear)
    }
    
    var createNewPostView: some View {
        HStack(spacing: 10) {
            Text("What do you care about today")
                .font(.system(size: 15))
            
            Spacer()
            
            Image("Attachments")
            Image("Camera")
            Image("Video")
        }.padding()
        .background(Color(uiColor: .lighterGray))
        .padding([.leading, .trailing], .generalPadding)
        .onTapGesture {
            viewModel.presentCreatePostView()
        }
    }
}

struct SocialNetworkView_Previews: PreviewProvider {
    static var previews: some View {
        SocialNetworkView(viewModel: .mock)
    }
}
