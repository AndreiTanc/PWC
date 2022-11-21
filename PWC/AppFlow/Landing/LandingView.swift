//
//  LandingView.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import SwiftUI

struct LandingView: View {
    var viewModel: LandingViewModel

    var backgroundColor: Color {
        AppUserDefaults.isDarkModeEnabled() ? Color(uiColor: .darkModeBackground) :
                                              Color(uiColor: .yellowBackground)
    }
    
    var body: some View {
        NavBarHiddenView {
            content
        }.background(Color(uiColor: .yellowBackground))
    }
    
    var content: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Image("LandingTopImage")
                    Text("Investing in people. Creating the future")
                        .foregroundColor(.white)
                        .font(.footnote)
                        
                }
                Spacer()
            }.padding()
            
            Spacer()
            
            Image("LandingLogo")
            
            Spacer()
            
            Text("Loading").font(.system(size: 20)).fontWeight(.semibold)
                .foregroundColor(AppUserDefaults.isDarkModeEnabled() ? .white : .black)
            
            Text("...").font(.system(size: 60)).padding(.top, -50)
                .foregroundColor(AppUserDefaults.isDarkModeEnabled() ? .white : .black)
            
            Spacer()
        }.padding()
        .onAppear {
            viewModel.handleOnAppear()
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView(viewModel: .mock)
    }
}
