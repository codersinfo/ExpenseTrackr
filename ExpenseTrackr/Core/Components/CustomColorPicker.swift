//
//  CustomColorPicker.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 02/02/23.
//

import SwiftUI

struct CustomColorPicker: View {
    @Binding var selectedColor: String
//    private let colors: [Color] = [.primaryBackground, .primaryColor2, .primaryColor4, .primaryTeal, .primaryYellow, .successColor, .warningColor, .errorColor]
    
    var body: some View {
        HStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(CategoryColor.allCases, id: \.rawValue) { color in
                        Circle()
                            .fill(Color(hex: color.rawValue) ?? .black)
                            .frame(width: 45, height: 45)
                            .opacity(color.rawValue == selectedColor ? 0.7 : 1.0)
                            .overlay {
                                if color.rawValue == selectedColor {
                                    Image(systemName: "checkmark")
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedColor = color.rawValue
                                }
                            }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            
//            ColorPicker("", selection: $selectedColor)
//                .labelsHidden()
//                .frame(width: 60, height: 45)
        }
    }
}

struct CustomColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomColorPicker(selectedColor: .constant("#65987a"))
            .previewLayout(.sizeThatFits)
    }
}
