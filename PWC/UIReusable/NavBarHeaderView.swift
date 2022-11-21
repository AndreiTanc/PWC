//
//  NavBarHeaderView.swift
//  PWC
//
//  Created by Andrei Tanc on 20.07.2022.
//

import SwiftUI

struct NavBarHeaderView: View {
    @State var backButtonText: String = ""
    var dismiss: () -> Void
    
    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image("BlackBack").padding(.trailing, 5)
            }
            
            Text(backButtonText)
                .foregroundColor(Color(uiColor: .yellowBackground))
            
            Spacer()
        }.padding().background(.white)
    }
}

struct NavBarHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarHeaderView(backButtonText: "Back", dismiss: {})
    }
}
