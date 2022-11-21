//
//  ProfileInfoView.swift
//  PWC
//
//  Created by Andrei Tanc on 20.07.2022.
//

import SwiftUI

struct ProfileInfoView: View {
    @ObservedObject var viewModel: ProfileInfoViewModel
    
    var body: some View {
        VStack {
            ImageTextField(text: $viewModel.name, imageName: "", placeholderText: "name*")
                .padding([.leading, .trailing, .top], .generalPadding)
            ImageTextField(text: $viewModel.email, imageName: "", placeholderText: "email", keyboardType: .emailAddress)
                .padding([.leading, .trailing], .generalPadding)
            ImageTextField(text: $viewModel.hiringDate, imageName: "", placeholderText: "hiring date")
                .padding([.leading, .trailing], .generalPadding)
            
            profileImageView
            
            ImageTextField(text: $viewModel.position, imageName: "", placeholderText: "position*")
                .padding([.leading, .trailing], .generalPadding)
            
//            BirthdateView
            
            HStack {
                CheckBoxView(checked: $viewModel.isGDPRChecked)
                Text("GDPR statement")
                Spacer()
            }.padding([.leading, .trailing], .generalPadding).padding([.top, .bottom], 5)
            
            HStack {
                CheckBoxView(checked: $viewModel.isOtherChecked)
                Text("other legal statement")
                Spacer()
            }.padding([.leading, .trailing], .generalPadding)
            
            saveButton
            
        }.background(Color(uiColor: .yellowBackground))
        .onAppear(perform: viewModel.handleOnAppear)
    }
    
    var profileImageView: some View {
        HStack {
            Spacer()
            
            settingsButton
                .opacity(0)
            
            Image("PolarBear")
                .resizable()
                .frame(width: 116, height: 116)
                .cornerRadius(58)
                .overlay(
                    RoundedRectangle(cornerRadius: 58)
                        .stroke(.white, lineWidth: 2)
                )
            
            settingsButton
            
            Spacer()
        }
    }
    
    var settingsButton: some View {
        Button {
            viewModel.goToSettings()
        } label: {
            Image("Setting")
        }
    }
    
    var saveButton: some View {
        Button("SAVE") {
            print("hi")
        }.frame(maxWidth: .infinity).frame(height: 50)
        .background(Color(uiColor: .blackButton))
        .foregroundColor(.white)
        .padding([.leading, .bottom, .trailing], .generalPadding)
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView(viewModel: .mock)
    }
}
