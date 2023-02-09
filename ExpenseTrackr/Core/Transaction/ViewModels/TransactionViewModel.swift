//
//  TransactionViewModel.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 27/01/23.
//

import Foundation

class TransactionViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    init() {
     //   getTransaction()
    }
    
//    func getTransaction() {
//        transactions = [ Transaction(title: "Grocery shopping", note: "Buy some grocery", amount: 1200, icon: "basket", color: .primaryBackground),
//                         Transaction(title: "Subcription", note: "Netflix monthly", amount: 300, icon: "list.dash.header.rectangle", color: .primaryBlue),
//                         Transaction(title: "Food", note: "Buy a chinese noodles", amount: 1000, icon: "fork.knife", color: .primaryYellow),
//                         Transaction(title: "Food club", note: "Buy a chinese noodles", amount: 1000, icon: "fork.knife", color: .primaryTeal),
//                         Transaction(title: "Food club", note: "Buy a chinese noodles", amount: 1000, icon: "fork.knife", color: .primaryTeal)]
//    }
}
