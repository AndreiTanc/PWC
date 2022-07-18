//
//  LandingView.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import SwiftUI

struct LandingView: View {
    var viewModel: LandingViewModel

    var body: some View {
        Text("Hi")
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView(viewModel: .mock)
    }
}
