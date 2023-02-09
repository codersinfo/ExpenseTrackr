//
//  HomeView.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 27/01/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    HeaderView()
                    summaryCard
                    RecentTransactionView()
                }
                .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    var summaryCard: some View {
        VStack(spacing: 10) {
            Text("Balance")
            Text("$30,000")
                .font(.largeTitle)
                .bold()
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "arrow.down")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.primaryBackground)
                            .frame(width: 15, height: 15)
                            .padding(5)
                            .background(Color.white)
                            .clipShape(Circle())
                        
                        Text("Income")
                    }
                    Text("$12,000.00")
                        .bold()
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    HStack {
                        Image(systemName: "arrow.up")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.primaryBackground)
                            .frame(width: 15, height: 15)
                            .padding(5)
                            .background(Color.white)
                            .clipShape(Circle())
                        
                        Text("Expenses")
                    }
                    
                    Text("$8,000.00")
                        .bold()
                }
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(Color.primaryBackground)
        .cornerRadius(15)
    }
}
