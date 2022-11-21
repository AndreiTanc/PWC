//
//  CreatePostSettingsButtonView.swift
//  PWC
//
//  Created by Andrei Tanc on 22.07.2022.
//

import SwiftUI

struct CreatePostSettingsButtonView: View {
    var type: ButtonType = .chooseCategory
    var handleOnTap: () -> Void
    
    var body: some View {
        Button {
            handleOnTap()
        } label: {
            HStack(spacing: 4) {
                Text(type.rawValue)
                    .foregroundColor(.white)
                    .font(.body)
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 8, height: 5)
                    .tint(.white)
            }.padding(10)
            .background(Color(uiColor: .darkModeBackground))
            .cornerRadius(100)
        }
    }
}

struct CreatePostSettingsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostSettingsButtonView(type: .chooseCategory, handleOnTap: {})
    }
}

extension CreatePostSettingsButtonView {
    enum ButtonType: String {
        case chooseCategory = "choose category"
        case audience = "audience"
    }
}
