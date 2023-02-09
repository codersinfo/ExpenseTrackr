//
//  IconButtonStyle.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 23/01/23.
//

import Foundation
import SwiftUI

struct IconButtonStyle: ButtonStyle {
    let bgColor: Color
    let icon: String
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(icon)
                .resizable()
                .scaledToFill()
                .frame(width: 24, height: 24)
            configuration.label
        }
        .frame(maxWidth: .infinity)
        .frame(height: 46)
        .background(bgColor)
        .cornerRadius(12)
        .opacity(configuration.isPressed ? 0.3 : 1)
    }
}
