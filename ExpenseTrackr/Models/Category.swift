//
//  Category.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 01/02/23.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

enum CategoryColor: String, CaseIterable {
    case viridianGreen = "#65987a"
    case easternBlue = "#209cb7"
    case java = "#16c6be"
    case fiord = "#454e6b"
    case tango = "#ea821e"
    case confetti = "#f0dd64"
    case crimson = "#d2124b"
    case buttercup = "#f2b91c"
    case tabasco = "#b31811"
    case keppel = "#30a099"
    
    var id: String {
        rawValue
    }
}

struct Category: Identifiable, Decodable {
    var id: String
    //var uid: String
    let name: String
    let color: String
    let icon: String
    let categoryType: TransactionType
    let isArchived: Bool
    
    init(id: String = UUID().uuidString, name: String, color: String, icon: String, categoryType: TransactionType, isArchived: Bool) {
        self.id = id
        self.name = name
        self.color = color
        self.icon = icon
        self.categoryType = categoryType
        self.isArchived = isArchived
    }
}

enum TransactionType: String, CaseIterable, Identifiable, Decodable {
    case expense = "Expense"
    case income = "Income"
    
    var color: Color {
        switch self {
        case .expense: return .red
        case .income: return .green
        }
    }
    
    var name: String {
        return rawValue.capitalized
    }
    
    var id: String {
        return rawValue.capitalized
    }
}

