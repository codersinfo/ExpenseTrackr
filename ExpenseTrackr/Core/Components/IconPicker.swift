//
//  IconPicker.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 02/02/23.
//

import SwiftUI

struct IconPicker: View {
    @Binding var selectedIcon: String
    let icons: [String]
    
    private let fixedView: [GridItem] = [
        GridItem(.flexible(), spacing: 0, alignment: .center),
        GridItem(.flexible(), spacing: 0, alignment: .center),
        GridItem(.flexible(), spacing: 0, alignment: .center),
        GridItem(.flexible(), spacing: 0, alignment: .center),
        GridItem(.flexible(), spacing: 0, alignment: .center)
    ]
    
    var body: some View {
        LazyVGrid(columns: fixedView) {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .padding()
                    .backgroundExView()
                    .overlay(alignment: .topTrailing) {
                        if icon == selectedIcon {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.successColor)
                                .offset(x: 5, y: -5)
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            selectedIcon = icon
                        }
                    }
            }
        }
    }
}

struct IconPicker_Previews: PreviewProvider {
   static let icons: [String] = ["fork.knife","pencil.tip","arrowshape.turn.up.backward.2","backpack","paperclip","link","person.2","person.wave.2","figure.roll","figure.archery","basketball","tennis.racket","volleyball","rosette","trophy","medal","globe"]
    
    static var previews: some View {
        IconPicker(selectedIcon: .constant("fork.knife"), icons: icons)
            .previewLayout(.sizeThatFits)
    }
}
