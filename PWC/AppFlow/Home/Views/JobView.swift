//
//  JobView.swift
//  PWC
//
//  Created by Andrei Tanc on 19.07.2022.
//

import SwiftUI

struct JobView: View {
    var job: Job
    var handleOnButtonTapped: () -> Void
    
    var applicantsText: String {
        "\(job.applicants) " + (job.applicants == 1 ? "applicant" : "applicants")
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("PolarBear")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 3 / 4 - 2 * CGFloat.generalPadding, height: 70)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10, corners: [.topLeft, .topRight])
            
            Text(job.title)
                .font(.footnote)
                .fontWeight(.semibold)
                .padding([.top, .leading], .generalPadding)
            
            HStack {
                Text(job.description + "\n\n\n\n\n")
                    .font(.footnote)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Spacer(minLength: 0)
            }
            
            HStack {
                Text(applicantsText)
                    .foregroundColor(.gray)
                    .font(.footnote)
                Spacer()
                
                Button {
                    handleOnButtonTapped()
                } label: {
                    Text("SEE JOB DETAILS").padding(5).foregroundColor(.white)
                }.background(Color(uiColor: .loginButtonYellow))
                .font(.footnote)
                
            }.padding([.leading, .trailing, .bottom])
            
        }.frame(width: UIScreen.main.bounds.width * 3 / 4 - 2 * CGFloat.generalPadding)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(uiColor: UIColor.lightGray), lineWidth: 1)
        ).padding(1).padding(.leading, .generalPadding)
    }
}

struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        JobView(job: .init(uuid: "", title: "", description: "", applicants: 2), handleOnButtonTapped: {})
    }
}
