//
//  Transaction.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 27/01/23.
//

import Foundation
import SwiftUI

struct Transaction: Identifiable {
    let id = UUID()
    let title: String
    let note: String
    let amount: Double
    let payeeName: String
    let date: Date
    let accountId: UUID
    let categoryId: UUID
    let image: Image?
    let type: TransactionType
    let recurrence: String
    
    init(title: String, note: String, amount: Double, payeeName: String, date: Date, accountId: UUID, categoryId: UUID, image: Image?, type: TransactionType, recurrence: String) {
        self.title = title
        self.note = note
        self.amount = amount
        self.payeeName = payeeName
        self.date = date
        self.accountId = accountId
        self.categoryId = categoryId
        self.image = image
        self.type = type
        self.recurrence = recurrence
    }
}
