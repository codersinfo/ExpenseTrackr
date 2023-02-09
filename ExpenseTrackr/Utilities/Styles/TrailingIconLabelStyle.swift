//
//  TrailingIconLabelStyle.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 02/02/23.
//

import Foundation
import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

