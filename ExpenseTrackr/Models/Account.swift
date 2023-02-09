//
//  Account.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 01/02/23.
//

import Foundation

enum PaymentMode: String {
    case cash
    case debitCard
    case creditCard
    case upi
    case cheque
    case internetBanking
}

struct Account: Identifiable {
    let id: UUID
    let name: String
    let currentBalance: Double
    let paymentMode: PaymentMode
    let color: String
}
