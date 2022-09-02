//
//  CustomInputField.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/02.
//

import SwiftUI

struct CustomInputField: View {
    let imageName: String
    let isSecure: Bool
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
            
        }
        .padding()
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "person",
                         isSecure: false,
                         placeholder: "Username",
                         text: .constant("Hero"))
    }
}
