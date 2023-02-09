//
//  HeaderView.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 27/01/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 15) {
            Image("flower")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(2)
                .background(
                    Circle()
                        .stroke(Color.gray, lineWidth: 2)
                )
            
            VStack(alignment: .leading) {
                Text("Hello, Ananya")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Good Morning!")
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "bell.badge")
                .renderingMode(.original)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
