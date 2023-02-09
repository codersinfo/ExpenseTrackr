//
//  CustomTabBar.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 27/01/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "house"
    case transaction = "arrow.left.arrow.right"
    case add = "plus"
    case analysis = "chart.bar"
    case profile = "person"
}

struct CustomTabBar: View {
    @Binding var currentTab: Tab
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    HStack {
                        Spacer()
                        
                        if tab == .add {
                            Button {
                                withAnimation {
                                    currentTab = tab
                                }
                            } label: {
                                Image(systemName: tab.rawValue)
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:24, height:24)
                                    .foregroundColor(.white)
                                    .padding(20)
                                    .background(Color.primaryBackground)
                                    .clipShape(Circle())
                                    .offset(y: -25)
                                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
                                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
                                
                            }
                        } else {
                            Button {
                                withAnimation {
                                    currentTab = tab
                                }
                            } label: {
                                VStack(spacing: 12) {
                                    Image(systemName: tab.rawValue)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                    
                                    if currentTab == tab {
                                        Circle()
                                            .fill(currentTab == tab ? Color.primaryBackground : .gray.opacity(0.5))
                                            .frame(width: 5, height: 5)
                                    }
                                }
                                .foregroundColor(currentTab == tab ? Color.primaryBackground : .gray.opacity(0.5))
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 24)
        .padding(.top, 30)
        .background(Color.white)
        .overlay(alignment: .topLeading) {
            Divider()
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CommonView()
    }
}
