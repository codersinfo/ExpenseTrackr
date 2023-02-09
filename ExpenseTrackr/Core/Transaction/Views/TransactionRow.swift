////
////  TransactionRow.swift
////  ExpenseTrackr
////
////  Created by Priya Shankar on 27/01/23.
////
//
//import SwiftUI
//
//struct TransactionRow: View {
//    let transaction: Transaction
//
//    var body: some View {
//        HStack(spacing: 12) {
//            Image(systemName: transaction.icon)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 30, height: 30)
//                .foregroundColor(transaction.color)
//                .padding()
//                .background(transaction.color.opacity(0.3).cornerRadius(20))
//
//            VStack(alignment: .leading, spacing: 5) {
//                Text(transaction.title)
//                    .font(.headline)
//
//                Text(transaction.note)
//                    .foregroundColor(.secondary)
//                    .font(.subheadline)
//            }
//            
//            Spacer()
//
//            Text("$\(transaction.amount)")
//                .font(.headline)
//        }
//        .padding()
//        .background(Color.gray.opacity(0.08))
//        .cornerRadius(12)
//    }
//}
//
//struct TransactionRow_Previews: PreviewProvider {
//    static let transaction = Transaction(title: "Grocery shopping", note: "Buy some grocery", amount: 1200, icon: "basket", color: .primaryBackground)
//
//    static var previews: some View {
//        TransactionRow(transaction: transaction)
//    }
//}
