//
//  PostHeaderView.swift
//  PWC
//
//  Created by Andrei Tanc on 15.08.2022.
//

import SwiftUI

struct PostHeaderView: View {
    var userName: String
    var date: String
    
    var body: some View {
        HStack {
            Image("PolarBear")
                .resizable()
                .frame(width: 34, height: 34)
                .cornerRadius(17)
                .overlay(
                    RoundedRectangle(cornerRadius: 17)
                        .stroke(Color(uiColor: UIColor.orangeButton), lineWidth: 1)
                )
            
            VStack (alignment: .leading, spacing: 0) {
                Text(userName)
                    .fontWeight(.semibold)
                
                if true {
                    Text(date)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
        }
    }
}

struct PostHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PostHeaderView(userName: "", date: "")
    }
}
