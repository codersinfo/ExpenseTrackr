//
//  CategoryRow.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 03/02/23.
//

import SwiftUI

struct CategoryRow: View {
    let category: Category
    
    var body: some View {
        HStack {
            Image(systemName: category.icon)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(Color(hex: category.color))
                .frame(width: 20, height: 20)
                .padding()
                .background(Color.white.cornerRadius(12))
                .padding(.vertical, 10)
                .padding(.leading, 10)
            
            Text(category.name)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .backgroundExView()
    }
}

struct CategoryRow_Previews: PreviewProvider {

    static var previews: some View {
        CategoryRow(category: .init(id: "c1YXQz9NrLeoHmeZcRx9f4op9Yp2", name: "Playing", color: "successColor", icon: "volleyball", categoryType: .income, isArchived: false))
    }
}
