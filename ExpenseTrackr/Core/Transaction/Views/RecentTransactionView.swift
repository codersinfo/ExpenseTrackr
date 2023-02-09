//
//  RecentTransactionView.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 27/01/23.
//

import SwiftUI

struct RecentTransactionView: View {
    @StateObject var transactionVM = TransactionViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Today")
                    .font(.headline)
                
                Spacer()
                
                Button("View all") {
                    
                }
            }
            
            VStack {
                ForEach(transactionVM.transactions) { transaction in
                   // TransactionRow(transaction: transaction)
                }
            }
        }
    }
}

struct RecentTransactionView_Previews: PreviewProvider {
    
    static var previews: some View {
        RecentTransactionView()
    }
}
