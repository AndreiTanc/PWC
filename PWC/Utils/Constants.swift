//
//  Constants.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation
import UIKit

enum Constants {
    enum Url: String {
        case base = "https://pwc-api.projects.advancedideas.ro"
        case privacy = "https://privacy"
        case terms = "https://terms"
    }
    
    enum RequestConstants: String {
        case clientId = "96c6a7e8-566f-4b48-83ba-fc7ea54297ac"
        case clientSecret = "igH87htCF8yO0dgN0bwsY6PsHvuTyeO7UUBV2paZ"
        
        case loginClientId = "96c6a7e8-5ad5-44cc-8611-62f5f4897db7"
        case loginClientSecret = "AGxVzk531cEgC5PLRQMndDm1U55miKMGloLLGH3x"
    }

    enum Padding: CGFloat {
        case general = 24
    }
    
    enum LightSetting: Int {
        case light = 0
        case darkMode = 1
    }
}

struct UtilVariables {
    static var user: User?
}

extension CGFloat {
    static let generalPadding = CGFloat(15)
    static let screenSizeWidth = UIScreen.main.bounds.width
    static let screenSizeHeight = UIScreen.main.bounds.height
}
