//
//  CategoryViewModel.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 03/02/23.
//

import Foundation
import SwiftUI
import Firebase

class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var didUploadCategory: Bool = false
    
    let service = CategoryService()
    
//    init() {
//        fetchCategories()
//    }
    
    func addNewCategory(name: String, color: String, icon: String, categoryType: String, isArchived: Bool) {
        guard let type = TransactionType(rawValue: categoryType) else {
            print("DEBUG: Error")
            return
        }
        
        let newCategory = Category(name: name, color: color, icon: icon, categoryType: type, isArchived: isArchived)
        
        service.addCategory(category: newCategory) { [weak self] result in
            if result {
                //dismiss screen
                self?.didUploadCategory = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    print("list of categories")
                    self?.fetchCategories()
                }
            } else {
                // Show error msg
            }
        }
    }
    
    func fetchCategories() {
        service.fetchCategoriesWithCompletion { [weak self] categories in
            self?.categories = categories
            print("Updated categories")
            //self.objectWillChange.send()
        }
    }
    
    //    func getDefaultCategories() -> [Category] {
    //        let categories: [Category] = [
    //            Category(name: "Food", color: .primaryBackground, icon: "pencil.tip", categoryType: .expense, isArchived: false),
    //            Category(name: "Coffee", color: .primaryYellow, icon: "pencil.tip", categoryType: .expense, isArchived: false),
    //            Category(name: "Cinema", color: .primaryYellow, icon: "pencil.tip", categoryType: .expense, isArchived: false),
    //            Category(name: "Vacation", color: .primaryYellow, icon: "pencil.tip", categoryType: .expense, isArchived: false),
    //            Category(name: "Rent", color: .primaryYellow, icon: "pencil.tip", categoryType: .expense, isArchived: false)]
    //
    //        return categories
    //    }
}
