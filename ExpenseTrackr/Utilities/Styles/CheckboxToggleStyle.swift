//
//  CheckboxToggleStyle.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 23/01/23.
//

import Foundation
import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundColor(configuration.isOn ? .primaryBackground : .gray.opacity(0.4))
            
            configuration.label
        }
        .onTapGesture {
            withAnimation(.easeOut) {
                configuration.isOn.toggle()
            }
        }
    }
}
