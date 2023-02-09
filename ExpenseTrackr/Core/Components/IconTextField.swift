//
//  IconTextField.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 23/01/23.
//

import SwiftUI

struct IconTextField: View {
    let placeholder: String
    let icon: String?
    @Binding var text: String
    
    init(_ placeholder: String, icon: String?, text: Binding<String>) {
        self.placeholder = placeholder
        self.icon = icon
        self._text = text
    }
    
    var body: some View {
        HStack {
            if let icon = icon {
                Image(systemName: icon)
                    .foregroundColor(.black)
            }
            TextField(placeholder, text: $text)
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
        }
        //.background(Color.gray.opacity(0.12))
        //.cornerRadius(12)
    }
}

struct IconTextField_Previews: PreviewProvider {
    static var previews: some View {
        IconTextField("Email", icon: nil, text: .constant(""))
    }
}
