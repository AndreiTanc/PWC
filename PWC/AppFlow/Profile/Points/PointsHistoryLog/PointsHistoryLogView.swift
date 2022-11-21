//
//  PointsHistoryLogView.swift
//  PWC
//
//  Created by Andrei Tanc on 29.08.2022.
//

import SwiftUI

struct PointsHistoryLogView: View {
    @ObservedObject var viewModel: PointsHistoryLogViewModel
    var body: some View {
        NavBarHiddenView {
            ScrollView {
                VStack {
                    ForEach(viewModel.pointLogs, id: \.uuid) { pointLog in
                        HStack {
                            Text("\(pointLog.points) \(pointLog.points == 1 ? "point" : "points")")
                            
                            Spacer()
                            Text(pointLog.comment ?? "")
                        }
                    }
                }
            }.onAppear(perform: viewModel.handleOnAppear)
        }
    }
}

struct PointsHistoryLogView_Previews: PreviewProvider {
    static var previews: some View {
        PointsHistoryLogView(viewModel: .mock)
    }
}
