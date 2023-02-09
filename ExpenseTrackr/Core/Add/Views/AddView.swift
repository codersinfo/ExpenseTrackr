//
//  AddView.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 01/02/23.
//

import SwiftUI

struct AddView: View {
    @State var selectedTab: String = "Income"
    let tabs = [TransactionType.income.name, TransactionType.expense.name]
    @State var amount: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            SegmentedControl(selected: $selectedTab, options: tabs, segmentRectColor: .primaryBackground, segmentBGColor: .primaryBackground1)
            
           // IconTextField("", icon: nil, text: $)
            Text("Amount")
                .padding(.top, 20)
            TextField("Amount", text: $amount)
                .font(.title2)
                .padding()
                .frame(width: 200)
                .backgroundExView()
                .multilineTextAlignment(.center)
            VStack {
                Text("Payee")
                Text("Category")
                Text("Date")
                Text("Note")
                Text("Account")
                Text("Recurrence")
                Text("Payment mode")
                Text("Image or invoice")
            }
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("Add")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
            AddView()
    }
}

struct bgTextField: ViewModifier {
   // var keyboardType: UIKeyboardType
    
    func body(content: Content) -> some View {
        content
            .background(Color.primaryBackground3)
            .cornerRadius(12)
            //.keyboardType(keyboardType)
    }
}
