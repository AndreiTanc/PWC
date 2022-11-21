//
//  ImprovementIdeaPostView.swift
//  PWC
//
//  Created by Andrei Tanc on 15.08.2022.
//

import SwiftUI

struct ImprovementIdeaPostView: View {
    var viewModel: ImprovementIdeaPostViewModel
    @State var isCommited = false
    
    var body: some View {
        VStack {
            PostHeaderView(userName: "user name",
                           date: "1h ago").padding(.generalPadding)
            content
        }.frame(width: UIScreen.main.bounds.width - 2 * CGFloat.generalPadding)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(uiColor: UIColor.lightGray), lineWidth: 1)
        )
    }
    
    var content: some View {
        VStack (alignment: .leading) {
            HStack {
                Spacer()
                Image("Improvement")
                Spacer()
            }.padding(.bottom)
            
            Text("Text to come here" + "\n\n\n")
                .fixedSize(horizontal: false, vertical: true)
                .font(.footnote)
                .lineLimit(3)
                .multilineTextAlignment(.leading)
                .padding([.leading, .trailing], .generalPadding)
            
            reactionsView.padding([.leading, .trailing, .bottom], .generalPadding)
        }
    }
    
    var reactionsView: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("Endorse")
                    .foregroundColor(.green)
                Text("5/9 endorse your idea")
                    .foregroundColor(.green)
                    .font(.system(size: 10))
                
                Spacer()
            }
            
            HStack {
                CheckBoxView(checked: $isCommited)
                Text("I am committed to supporting my colleagues in implementing the proposal.")
                    .font(.system(size: 10))
                Spacer()
            }
            
            HStack {
                Button {
                    print("REJECT")
                } label: {
                    Text("REJECT")
                        .foregroundColor(.white)
                        .font(.system(size: 10))
                }.padding(.generalPadding / 1.5)
                .frame(width: UIScreen.main.bounds.size.width / 3)
                .background(Color(uiColor: .gray))
                
                Spacer()
                
                Button {
                    viewModel.goToDetails()
                } label: {
                    Text("SEND FEEDBACK")
                        .foregroundColor(.white)
                        .font(.system(size: 10))
                }.padding(.generalPadding / 1.5)
                .background(Color(uiColor: .yellowBackground))
            }
        }
    }
}

struct ImprovementIdeaPostView_Previews: PreviewProvider {
    static var previews: some View {
        ImprovementIdeaPostView(viewModel: .mock)
    }
}
