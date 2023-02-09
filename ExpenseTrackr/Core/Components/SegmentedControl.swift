//
//  SegmentedControl.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 01/02/23..
//

import SwiftUI

struct SegmentedControl: View {
    @Binding var selected: String
    let options: [String]
    @Namespace var rect
    var segmentRectColor: Color = .primaryBackground
    var segmentBGColor: Color = .gray
    
    var body: some View {
        HStack {
            ForEach(options, id: \.self) { option in
                ZStack {
                    if selected == option {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(segmentRectColor)
                            .matchedGeometryEffect(id: "option", in: rect)
                    }
                    
                    Button {
                        withAnimation {
                            selected = option
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text(option)
                                .foregroundColor(selected == option ? .white : .black)
                            Spacer()
                        }
                    }
                }
            }
        }
        .padding(3)
        .frame(height: 50)
        .background(segmentBGColor)
//        .overlay(alignment: .center, content: {
//            RoundedRectangle(cornerRadius: 10, style: .continuous)
//                .stroke(segmentRectColor, lineWidth: 1)
//        })
        .cornerRadius(10)
        //.padding(.horizontal, 8)
    }
}

struct SegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControl(selected: .constant("Income"), options: ["Income", "Expense"], segmentRectColor: .primaryBackground, segmentBGColor: .primaryBackground1)
    }
}
