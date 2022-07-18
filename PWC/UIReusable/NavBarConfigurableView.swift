//
//  NavBarConfigurableView.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import SwiftUI

struct NavBarConfigurableView<
    Content: View,
    LeadingButton: View,
    PrincipalButton: View,
    TrailingButton: View
>: View {
    var navBarHidden: Bool
    var title: String?
    var titleDisplayMode: NavigationBarItem.TitleDisplayMode
    var colorScheme: ColorScheme

    var content: Content
    var navBarLeadingButton: LeadingButton
    var navBarPrincipalButton: PrincipalButton
    var navBarTrailingButton: TrailingButton

    init(
        navBarHidden: Bool = false,
        title: String? = nil,
        titleDisplayMode: NavigationBarItem.TitleDisplayMode = .large,
        colorScheme: ColorScheme = .light,
        content: @escaping () -> Content,
        navBarLeadingButton: @escaping () -> LeadingButton,
        navBarPrincipalButton: @escaping () -> PrincipalButton,
        navBarTrailingButton: @escaping () -> TrailingButton
    ) {
        self.navBarHidden = navBarHidden
        self.title = title
        self.titleDisplayMode = titleDisplayMode
        self.colorScheme = colorScheme
        self.content = content()
        self.navBarLeadingButton = navBarLeadingButton()
        self.navBarPrincipalButton = navBarPrincipalButton()
        self.navBarTrailingButton = navBarTrailingButton()
    }

    var body: some View {
        content
            .navigationTitle(Text(title ?? ""))
            .navigationBarHidden(navBarHidden)
            .preferredColorScheme(colorScheme)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(titleDisplayMode)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    navBarLeadingButton
                }

                ToolbarItem(placement: .principal) {
                    navBarPrincipalButton
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    navBarTrailingButton
                }
            }
    }
}
