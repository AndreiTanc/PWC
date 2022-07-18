//
//  RootNavigationView.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import SwiftUI
import Introspect

struct RootNavigationView<Content: View>: View {
    var content: Content
    var navigationControllerProxy: (UINavigationController) -> Void
    
    init(content: @escaping () -> Content,
         navigationControllerProxy: @escaping (UINavigationController) -> Void) {
        self.content = content()
        self.navigationControllerProxy = navigationControllerProxy
    }
    
    var body: some View {
        NavigationView {
            content
                .introspectNavigationController { navigationController in
                    navigationControllerProxy(navigationController)
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
