//
//  NavBarHiddenView.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import SwiftUI

struct NavBarHiddenView<Content: View>: View {
    var colorScheme: ColorScheme = .light

    var content: () -> Content

    var body: some View {
        NavBarConfigurableView(
            navBarHidden: true,
            colorScheme: colorScheme,
            content: content
        ) {
            EmptyView()
        } navBarPrincipalButton: {
            EmptyView()
        } navBarTrailingButton: {
            EmptyView()
        }
    }
}
