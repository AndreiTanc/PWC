//
//  NewsView.swift
//  PWC
//
//  Created by Andrei Tanc on 19.07.2022.
//

import SwiftUI
import Kingfisher

struct ArticleView: View {
    @ObservedObject var viewModel: ArticleViewModel
    var handleOnArticleTapped: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            KFImage(URL(string: viewModel.article.cover))
                .resizable()
                .placeholder({
#warning("must change placeholder")
                    Image("PolarBear")
                })
                .frame(width: UIScreen.main.bounds.width - 2 * CGFloat.generalPadding - 15, height: 200)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10, corners: [.topLeft, .topRight])
            
            HStack {
                Text(viewModel.article.body + "\n\n\n")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.footnote)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Spacer(minLength: 0)
            }
            
            HStack {
                Spacer()
                ReactionButtonView(reactionType: .like, numberOfReactions: $viewModel.article.reactions.like) {
                    viewModel.handleOnReactionButtonPressed(.like)
                }
                
#warning("must change to love")
                ReactionButtonView(reactionType: .like, numberOfReactions: $viewModel.article.reactions.love) {
                    viewModel.handleOnReactionButtonPressed(.love)
                }
                
                ReactionButtonView(reactionType: .dislike, numberOfReactions: $viewModel.article.reactions.thumbsDown) {
                    viewModel.handleOnReactionButtonPressed(.dislike)
                }
            }.padding([.leading, .trailing, .bottom])
            
        }.frame(width: UIScreen.main.bounds.width - 2 * CGFloat.generalPadding - 15)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(uiColor: UIColor.lightGray), lineWidth: 1)
        ).padding(1).padding(.leading, .generalPadding)
        .onTapGesture {
            handleOnArticleTapped()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(viewModel: .mock, handleOnArticleTapped: {})
    }
}
