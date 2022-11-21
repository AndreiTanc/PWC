//
//  PostView.swift
//  PWC
//
//  Created by Andrei Tanc on 10.08.2022.
//

import SwiftUI

struct PostView: View {
    @ObservedObject var viewModel: PostViewModel
    
    var body: some View {
        VStack {
            PostHeaderView(userName: viewModel.postData.user.name,
                           date: viewModel.postData.date)
                .padding(.generalPadding)
            content
        }.frame(width: UIScreen.main.bounds.width - 2 * CGFloat.generalPadding)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(uiColor: UIColor.lightGray), lineWidth: 1)
        )
    }
    
    var content: some View {
        VStack (alignment: .leading) {
            Image("PolarBear")
                .resizable()
                .frame(height: 200)
                .frame(maxWidth: .infinity)
            
            Text(viewModel.postData.body + "\n\n\n")
                .fixedSize(horizontal: false, vertical: true)
                .font(.footnote)
                .lineLimit(3)
                .multilineTextAlignment(.leading)
                .padding([.leading, .trailing], .generalPadding)
            
            reactionsView.padding([.leading, .trailing, .bottom], .generalPadding)
        }
    }
    
    var reactionsView: some View {
        HStack (spacing: 5) {
            if true {
                Button(viewModel.commentsButtonTitle) {
                    print("take me to comments")
                }.foregroundColor(.gray)
                .font(.system(size: 10))
            }
            
            Button("Button title".uppercased()) {
                print("do what it needs to do")
            }.foregroundColor(.white)
            .font(.system(size: 10))
            .padding(.generalPadding / 1.5)
            .background(Color(uiColor: .yellowBackground))
            
            Spacer(minLength: 0)
            
            if true {
                ReactionButtonView(reactionType: .like, numberOfReactions: $viewModel.postData.reactions.like) {
                    viewModel.handleOnReactionButtonPressed(.like)
                }
                
#warning("must change to love")
                ReactionButtonView(reactionType: .like, numberOfReactions: $viewModel.postData.reactions.love) {
                    viewModel.handleOnReactionButtonPressed(.love)
                }
                
                ReactionButtonView(reactionType: .dislike, numberOfReactions: $viewModel.postData.reactions.thumbsDown) {
                    viewModel.handleOnReactionButtonPressed(.dislike)
                }
            }
        }.frame(maxWidth: .infinity)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(viewModel: .mock)
    }
}
