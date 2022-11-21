//
//  PostsSectionContainerView.swift
//  PWC
//
//  Created by Andrei Tanc on 24.08.2022.
//

import SwiftUI

struct PostsSectionContainerView: View {
    @ObservedObject var viewModel: PostsSectionContainerViewModel
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            Text(viewModel.title)
                .foregroundColor(Color(uiColor: .orangeButton))
                .fontWeight(.semibold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(viewModel.posts, id: \.uuid) { post in
                        PostView(viewModel: .init(post: post, router: viewModel.router))
                            .frame(maxWidth: .infinity)
                    }
                }
            }
        }.frame(maxWidth: .infinity)
        .padding(.generalPadding)
    }
}

//struct PostsSectionContainerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostsSectionContainerView()
//    }
//}
