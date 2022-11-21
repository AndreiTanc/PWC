//
//  ReactionButtonView.swift
//  PWC
//
//  Created by Andrei Tanc on 21.07.2022.
//

import SwiftUI

enum ReactionType: String {
    case like = "like"
    case love = "love"
    case dislike = "thumbs-down"
}

struct ReactionButtonView: View {
    var reactionType: ReactionType
    @Binding var numberOfReactions: Int
    var handleOnTap: () -> Void
    
    var body: some View {
        HStack(spacing: 2) {
            Button {
                handleOnTap()
            } label: {
                Image(reactionType.rawValue)
            }
            
            Text("\(numberOfReactions)")
                .font(.footnote)
                .fontWeight(.light)
        }.padding(.leading, 5)
    }
}

struct ReactionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ReactionButtonView(reactionType: .like,numberOfReactions: .constant(123), handleOnTap: {})
    }
}
