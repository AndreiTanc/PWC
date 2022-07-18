//
//  LandingView.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import SwiftUI

struct LandingView: View {
    var viewModel: LandingViewModel

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
            Spacer()
        }.padding()
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView(viewModel: .mock)
    }
}
