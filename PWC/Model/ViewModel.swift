//
//  ViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import SwiftUI

class ViewModel: ObservableObject {
    var router: Router

    var networking: Networking {
        router.networking
    }
    
    init(router: Router) {
        self.router = router
    }
    
    func goBack() {
        router.popViewController(animated: true)
    }
}
