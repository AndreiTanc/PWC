//
//  RewardsView.swift
//  PWC
//
//  Created by Andrei Tanc on 12.08.2022.
//

import SwiftUI

struct RewardsView: View {
    @ObservedObject var viewModel: RewardsViewModel
    
    var body: some View {
        Text("rewards")
    }
}

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView(viewModel: .mock)
    }
}
