//
//  JobApplicationView.swift
//  PWC
//
//  Created by Andrei Tanc on 20.07.2022.
//

import SwiftUI

struct JobApplicationView: View {
    @ObservedObject var viewModel: JobApplicationViewModel
    
    var body: some View {
        NavBarHiddenView {
            VStack {
                NavBarHeaderView(backButtonText: viewModel.job.title, dismiss: {
                    viewModel.goBack()
                }).padding(.bottom, 1.5 * .generalPadding).padding(.top, 1)
                content
            }
        }.background(Color(uiColor: .yellowBackground))
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    var content: some View {
        VStack {
            ImageTextField(text: $viewModel.name, imageName: "Name", placeholderText: "name*")
            ImageTextField(text: $viewModel.surname, imageName: "Name", placeholderText: "surname*")
            ImageTextField(text: $viewModel.email, imageName: "Email",
                           placeholderText: "email*", keyboardType: .emailAddress)
            ImageTextField(text: $viewModel.phone, imageName: "Phone",
                           placeholderText: "phone*", keyboardType: .numberPad)
            
            uploadCVButton
            
            Spacer()
            
            Button("APPLY") {
                viewModel.handleOnUploadCVButtonPressed()
            }.padding().frame(width: UIScreen.main.bounds.size.width / 2)
            .background(Color(uiColor: .blackButton))
            .foregroundColor(.white)
            
            Spacer()
            Spacer()
        }.padding(.generalPadding)
    }
    
    var uploadCVButton: some View {
        Button("Upload CV (max. 5MB, pdf format)") {
            print("should upload CV")
        }.frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color(uiColor: .orangeButton))
        .foregroundColor(.white)
        .padding(.top)
    }
}

struct JobApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        JobApplicationView(viewModel: .mock)
    }
}
