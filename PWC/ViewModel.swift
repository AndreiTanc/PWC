//
//  ViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import SwiftUI

class ViewModel: ObservableObject {
    var router: Router

    init(router: Router) {
        self.router = router
    }
}
