//
//  ImprovementIdeaDetailsView.swift
//  PWC
//
//  Created by Andrei Tanc on 15.08.2022.
//

import SwiftUI

struct ImprovementIdeaDetailsView: View {
    @ObservedObject var viewModel: ImprovementIdeaDetailsViewModel
    
    var body: some View {
        NavBarHiddenView {
            content
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button {
                viewModel.goBack()
            } label: {
                Image("BlackBack").padding(.trailing, 5)
            }
            
            Image("Improvement").frame(maxWidth: .infinity)
                
            Text("Improvement idea:")
                .fontWeight(.bold)
                .font(.system(size: 22))
                .padding([.leading, .top], .generalPadding)
            
            HStack {
                Image("Chat")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text("Write your idea here:")
                    .foregroundColor(.init(uiColor: .orangeButton))
                    .font(.footnote)
            }.padding([.leading, .bottom], .generalPadding)
            
            ZStack {
                TextEditor(text: $viewModel.improvementText)
                Text(viewModel.improvementText)
                    .opacity(0)
                    .padding(8)
            }.background(Color.init(uiColor: .lighterGray))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(uiColor: UIColor.orangeButton), lineWidth: 1)
            )
            
            HStack {
                CheckBoxView(checked: $viewModel.isCommited)
                Text("I am committed to supporting my colleagues in implementing the proposal.")
                    .font(.system(size: 10))
                Spacer()
            }.padding(.generalPadding)
            
            Button {
                print("sending")
            } label: {
                Text("SEND")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }.padding(.generalPadding / 1.5)
            .frame(maxWidth: .infinity)
            .background(Color.init(uiColor: .yellowBackground))

        }.padding(.generalPadding)
    }
}

struct ImprovementIdeaDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ImprovementIdeaDetailsView(viewModel: .mock)
    }
}
