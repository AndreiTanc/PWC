//
//  SettingsView.swift
//  PWC
//
//  Created by Andrei Tanc on 17.08.2022.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        Text("settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: .mock)
    }
}
