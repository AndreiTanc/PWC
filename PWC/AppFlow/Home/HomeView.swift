//
//  HomeView.swift
//  PWC
//
//  Created by Andrei Tanc on 19.07.2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavBarHiddenView {
            content
        }
    }
    
    var content: some View {
        VStack {
            header.padding(.generalPadding)

            ScrollView {
                VStack(alignment: .leading) {
                    newsView.padding([.top, .bottom], .generalPadding)
                    jobsView.padding([.top, .bottom], .generalPadding)
                    eventsView.padding([.bottom], .generalPadding)
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }.onAppear(perform: viewModel.handleOnAppear)
    }
    
    var header: some View {
        HStack(spacing: 4) {
            Image("homeScreenHeader")
            
            if !viewModel.isLoggedIn {
                Button("Register") {
                    viewModel.goToRegister()
                }.foregroundColor(.white).frame(maxWidth: .infinity).frame(height: 44)
                .background(.red)
                
                Button("Login") {
                    viewModel.goToLogin()
                }.foregroundColor(.white).frame(maxWidth: .infinity).frame(height: 44)
                .background(Color(uiColor: .loginButtonYellow))
            } else {
                Button("Logout") {
                    viewModel.logout()
                }.foregroundColor(.white).frame(maxWidth: .infinity).frame(height: 44)
                .background(Color(uiColor: .red))
            }
        }.frame(maxWidth: .infinity)
    }
    
    var newsView: some View {
        VStack(alignment: .leading) {
            Text("#News")
                .foregroundColor(Color(uiColor: .orangeButton))
                .fontWeight(.semibold)
                .padding(.leading, .generalPadding)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(viewModel.news, id: \.uuid) { newArticle in
                        ArticleView(viewModel: .init(router: viewModel.router,
                                                     article: newArticle)) {
                            viewModel.goToArticleDetails(newArticle)
                        }
                    }
                }.padding(.bottom, 1)
            }
        }
    }
    
    var jobsView: some View {
        VStack(alignment: .leading) {
            Text("#Jobs")
                .foregroundColor(Color(uiColor: .orangeButton))
                .fontWeight(.semibold)
                .padding(.leading, .generalPadding)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(viewModel.jobs, id: \.uuid) { job in
                        JobView(job: job) {
                            viewModel.goToJobDetails(job)
                        }
                    }
                }
            }
        }
    }
    
    var eventsView: some View {
        VStack(alignment: .leading) {
            Text("#Events")
                .foregroundColor(Color(uiColor: .orangeButton))
                .fontWeight(.semibold)
                .padding(.leading, .generalPadding)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(viewModel.events, id: \.uuid) { event in
                        ArticleView(viewModel: .init(router: viewModel.router,
                                                     article: event)) {
                            viewModel.goToArticleDetails(event)
                        }
                    }
                }.padding(.bottom, 1)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .mock)
    }
}
