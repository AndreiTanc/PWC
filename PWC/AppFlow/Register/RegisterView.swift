//
//  RegisterView.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel: RegisterViewModel
    
    var body: some View {
        NavBarHiddenView {
            VStack(spacing: 0) {
                NavBarHeaderView(dismiss: {
                    viewModel.goBack()
                }).padding(.top, 1)
                content
            }
        }.background(Color(uiColor: .yellowBackground))
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    var content: some View {
        VStack(alignment: .center) {
            Image("Register").resizable().aspectRatio(contentMode: .fit).frame(maxWidth: .infinity).padding(.generalPadding)
                .background(Color.white).padding(.bottom, .generalPadding)
            
            loginForm
            
            Spacer()
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Image("LandingTopImage")
                    Text("Investing in people. Creating the future")
                        .foregroundColor(.white)
                        .font(.footnote)
                }
            }.padding()
        }.frame(maxHeight: .infinity)
        
    }
    
    var loginForm: some View {
        VStack {
            ImageTextField(text: $viewModel.name, imageName: "Name", placeholderText: "name*")
                .padding([.leading, .trailing], .generalPadding)
            ImageTextField(text: $viewModel.email, imageName: "Email",
                           placeholderText: "email*", keyboardType: .emailAddress)
                .padding([.leading, .trailing], .generalPadding)
            ImageTextField(text: $viewModel.password, imageName: "Password", placeholderText: "password*")
                .padding([.leading, .trailing], .generalPadding)
            
            Button("REGISTER") {
                viewModel.handleOnRegisterTapped()
            }.frame(maxWidth: .infinity).frame(height: 50).foregroundColor(.white).background(Color(uiColor: .blackButton)).padding(.generalPadding)
            
            HStack {
                Button("Login") {
                    viewModel.goToLogin()
                }.frame(alignment: .leading).foregroundColor(.black)
                Spacer()
            }.padding([.leading, .trailing, .bottom], .generalPadding)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(viewModel: .mock)
    }
}
