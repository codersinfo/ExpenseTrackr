//
//  CategoryIconView.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 02/02/23.
//

import SwiftUI

struct CategoryIconView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var selectedIcon: String
    let icons: [String] = ["fork.knife","pencil.tip","arrowshape.turn.up.backward.2","backpack","paperclip","link","person.2","person.wave.2","figure.roll","figure.archery","basketball","tennis.racket","volleyball","rosette","trophy","medal","globe"]
    
    var body: some View {
        VStack(alignment: .leading) {
            IconPicker(selectedIcon: $selectedIcon, icons: icons)
        }
        
        //            Button {
        //                dismiss()
        //            } label: {
        //                Text("Sumbit")
        //                    .padding()
        //                    .foregroundColor(.white)
        //                    .frame(maxWidth: .infinity)
        //                    .background(Color.primaryBackground)
        //                    .cornerRadius(10)
        //                    .padding()
        //            }
    }
}

struct CategoryIconView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryIconView(selectedIcon: .constant("pencil.tip"))
    }
}
