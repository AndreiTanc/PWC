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
    
    var body: some View {
        HStack {
            Image(imageName)
            TextField(placeholderText, text: $text)
        }
        .padding().background(Color(uiColor: .white))
        .padding([.leading, .trailing], .generalPadding)
    }
}

struct ImageTextField_Previews: PreviewProvider {
    static var previews: some View {
        ImageTextField(text: .constant(""), imageName: "Email", placeholderText: "Placeholder")
    }
}
