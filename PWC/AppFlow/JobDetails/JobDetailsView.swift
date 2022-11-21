//
//  JobDetailsView.swift
//  PWC
//
//  Created by Andrei Tanc on 20.07.2022.
//

import SwiftUI

struct JobDetailsView: View {
    @ObservedObject var viewModel: JobDetailsViewModel
    
    var body: some View {
        NavBarHiddenView {
            VStack {
                NavBarHeaderView(backButtonText: viewModel.job.title) {
                    viewModel.goBack()
                }
                content.padding(.generalPadding)
            }
        }
    }
    
    var content: some View {
        ScrollView {
            VStack {
                HStack {
                    Text(viewModel.job.description)
                        .multilineTextAlignment(.leading)
                        .font(.footnote)
                    
                    Spacer()
                }
                
                Button("APPLY FOR THIS JOB") {
                    viewModel.handleOnApplyButtonPressed()
                }.frame(width: UIScreen.main.bounds.size.width / 2)
                .padding()
                .foregroundColor(.white)
                .background(Color(uiColor: .yellowBackground))
                .padding(.top, 20)
            }.frame(maxWidth: .infinity)
        }
    }
}

struct JobDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        JobDetailsView(viewModel: .mock)
    }
}
