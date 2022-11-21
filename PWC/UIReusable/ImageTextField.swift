//
//  ImageTextField.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import SwiftUI

struct ImageTextField: View {
    @Binding var text: String
    var imageName: String
    var placeholderText: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        HStack {
            if imageName != "" {
                Image(imageName)
            }
            TextField(placeholderText, text: $text)
                .disableAutocorrection(true)
                .keyboardType(keyboardType)
                .textInputAutocapitalization(.never)
        }
        .padding().background(Color(uiColor: .white))
    }
}

struct ImageTextField_Previews: PreviewProvider {
    static var previews: some View {
        ImageTextField(text: .constant(""), imageName: "Email", placeholderText: "Placeholder")
    }
}
