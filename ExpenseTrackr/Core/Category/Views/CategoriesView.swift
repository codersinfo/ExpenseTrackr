//
//  CategoriesView.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 02/02/23.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject var vm = CategoryViewModel()
    @Binding var showTabBar: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
                List {
                    ForEach(vm.categories) { category in
                       CategoryRow(category: category)
                    }
                }
        }
        .onAppear(perform: {
            showTabBar = false
            vm.fetchCategories()
        })
        .navigationTitle("Categories")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    AddCategoryView()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CategoriesView(showTabBar: .constant(false))
        }
    }
}
