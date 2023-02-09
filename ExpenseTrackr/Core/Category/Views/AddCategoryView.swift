//
//  AddCategoryView.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 02/02/23.
//

import SwiftUI

struct AddCategoryView: View {
    @State var name: String = ""
    @State var selectedType: String = "Expense"
    @State var selectedColor: String = "#65987a"
    @State var selectedIcon: String = "fork.knife"
    @Environment(\.dismiss) var dismiss
    @ObservedObject var categoryVM = CategoryViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    categoryType
                    
                    categoryName
                    
                    categoryAppearence
                }
                .padding()
            }
            
            Button {
                print("Add btn")
                categoryVM.addNewCategory(name: name, color: selectedColor, icon: selectedIcon, categoryType: selectedType, isArchived: false)
            } label: {
                Text("Add")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(!name.isEmpty ? Color.successColor : .disabledTextColor)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            .disabled(name.count == 0)
        }
        .onReceive(categoryVM.$didUploadCategory, perform: { output in
            if output {
                dismiss()
            }
        })
        .navigationTitle("Add")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Text("Dismiss")
                }
            }
        }
    }
}

struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddCategoryView()
        }
    }
}


extension AddCategoryView {
    private var categoryName: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Category Name")
                .font(.headline)
            
            TextField("New category", text: $name)
                .padding()
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primaryBackground ,lineWidth: 1)
                }
        }
    }
    
    private var categoryType: some View {
        VStack(alignment: .leading) {
            Text("Type")
                .font(.headline)
            
            SegmentedControl(selected: $selectedType, options: [ TransactionType.expense.name, TransactionType.income.name], segmentRectColor: .primaryBackground, segmentBGColor: .primaryBackground3)
        }
    }
    
//    private var categoryIcon: some View {
//        VStack(alignment: .leading) {
//            
//                
//                
////                NavigationLink {
////                    CategoryIconView(selectedIcon: $selectedIcon)
////                } label: {
////                    Label("Choose a icon", systemImage: "chevron.right")
////                        .labelStyle(.trailingIcon)
////                        .padding(.vertical)
////
////                }
//        }
//    }
}

extension AddCategoryView {
    private var categoryAppearence: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Appearence")
                .font(.headline)
            
            Divider()
            
            Image(systemName: selectedIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
                .foregroundColor(Color(hex: selectedColor))
                .padding(8)
                .background(Color(hex: selectedColor).opacity(0.2))
                .cornerRadius(10)
            
            Text("\(selectedColor)")
            
            VStack(alignment: .leading) {
                Text("Select a Color")
                    .font(.headline)
                Divider()
                
                CustomColorPicker(selectedColor: $selectedColor)
            }
                     
            VStack(alignment: .leading) {
                Text("Icon")
                    .font(.headline)
                Divider()
                
                CategoryIconView(selectedIcon: $selectedIcon)
                    .padding(.top)
            }
        }
    }
}
