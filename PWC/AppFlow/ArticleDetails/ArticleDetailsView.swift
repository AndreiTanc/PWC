//
//  ArticleDetailsView.swift
//  PWC
//
//  Created by Andrei Tanc on 22.07.2022.
//

import SwiftUI
import Kingfisher

struct ArticleDetailsView: View {
    @ObservedObject var viewModel: ArticleDetailsViewModel
    
    var body: some View {
        NavBarHiddenView {
            VStack {
                NavBarHeaderView(backButtonText: "#COLLABORATION") {
                    viewModel.goBack()
                }
                content.padding(.generalPadding)
            }
        }
    }
    
    var content: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.article.title)
                    .fontWeight(.semibold)
                    .font(.footnote)
                
                KFImage(URL(string: viewModel.article.cover))
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 225)
                
                Text(viewModel.article.body)
                    .font(.footnote)
                    .padding(.bottom)
                
                reactionsView
                addCommentButton
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    var reactionsView: some View {
        HStack {
            Image("Comment")
#warning("must change number of comments with real value")
            Button(viewModel.commentsButtonTitle) {
                viewModel.handleOnCommentsButtonTapped()
            }.foregroundColor(Color(uiColor: .yellowBackground))
            
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
        }
    }
    
    var addCommentButton: some View {
        Button("ADD COMMENT") {
            viewModel.handleOnCommentsButtonTapped()
        }.foregroundColor(.white)
        .padding()
        .frame(height: 50)
        .background(Color(uiColor: .yellowBackground))
    }
}

struct ArticleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailsView(viewModel: .mock)
    }
}
