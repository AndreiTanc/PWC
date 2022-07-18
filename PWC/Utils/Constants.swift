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
        case privacy = "https://privacy"
        case terms = "https://terms"
    }

    enum Padding: CGFloat {
        case general = 24
    }
}

extension CGFloat {
    static let generalPadding = CGFloat(24)
    static let screenSizeWidth = UIScreen.main.bounds.width
    static let screenSizeHeight = UIScreen.main.bounds.height
}
