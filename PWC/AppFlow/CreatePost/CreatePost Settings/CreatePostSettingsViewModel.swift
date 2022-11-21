//
//  CreatePostSettingsViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 01.08.2022.
//

import Foundation

class CreatePostSettingsViewModel: ViewModel {
    var type: CreatePostSettingType
    
    init(type: CreatePostSettingType, router: Router) {
        self.type = type
        super.init(router: router)
    }
}

extension CreatePostSettingsViewModel {
    enum CreatePostSettingType: String {
        case audience = "audience"
        case category = "category"
    }
    
}
