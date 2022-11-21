//
//  CreatePostView.swift
//  PWC
//
//  Created by Andrei Tanc on 22.07.2022.
//

import SwiftUI

struct CreatePostView: View {
    @ObservedObject var viewModel: CreatePostViewModel
    
    var body: some View {
        NavBarHiddenView {
            ZStack {
                Color(uiColor: .darkModeBackground).ignoresSafeArea()
                
                VStack(spacing: 15) {
                    headerView.padding(.bottom, 10)
                    textArea
                    mediaView.padding(.bottom, 10)
                    createPostButton
                }.padding(.generalPadding)
                .background(.white)
                .padding(.generalPadding)
            }
        }
    }
    
    var headerView: some View {
        VStack {
            HStack {
                Button {
                    viewModel.goBack()
                } label: {
                    Image("BlackBack").padding(.trailing, 5)
                }
                
                Spacer()
                
                Text("Create a post")
                    .fontWeight(.bold)
                    .font(.title)
            }
            
            HStack {
                Spacer()
                
                CreatePostSettingsButtonView(type: .chooseCategory) {
//                    did tap
                }
                
                CreatePostSettingsButtonView(type: .audience) {
//                    did tap
                }
            }
        }
    }
    
    var textArea: some View {
        TextField("What do you care about today", text: $viewModel.text)
            .lineLimit(10)
            .padding()
            .frame(height: UIScreen.main.bounds.size.width * 2 / 3, alignment: .topLeading)
            .background(Color(uiColor: .lighterGray))
    }
    
    var mediaView: some View {
        HStack(spacing: 15) {
            Text("You may add").padding([.leading, .trailing])
            Button {
                viewModel.handleOnAttachmentsButtonTapped()
            } label: {
                Image("Attachments")
            }
            
            Button {
                viewModel.handleOnCameraButtonTapped()
            } label: {
                Image("Camera")
            }
            
            Button {
                viewModel.handleOnVideoButtonTapped()
            } label: {
                Image("Video")
            }
            Spacer()
        }
    }
    
    var createPostButton: some View {
        Button {
            viewModel.handleOnCreatePostButtonTapped()
        } label: {
            Text("CREATE POST")
                .fontWeight(.semibold)
        }.frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color(uiColor: .yellowBackground))
        .foregroundColor(.white)
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView(viewModel: .mock)
    }
}
