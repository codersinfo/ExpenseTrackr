//
//  IconSecureField.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 23/01/23.
//

import SwiftUI

struct IconSecureField: View {
    let placeholder: String
    let icon: String
    @Binding var text: String
    
    init(_ placeholder: String, icon: String, text: Binding<String>) {
        self.placeholder = placeholder
        self.icon = icon
        self._text = text
    }
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
            
            SecureField(placeholder, text: $text)
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
        }
    }
}

struct IconSecureField_Previews: PreviewProvider {
    static var previews: some View {
        IconSecureField("Password", icon: "lock", text: .constant(""))
    }
}
