//
//  CategoryService.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 07/02/23.
//

import Firebase
import FirebaseFirestore

struct CategoryService {
    //func addCategory(name: String, color: String, icon: String, category_Type: String, isArchived: Bool) {
    let collectionName = "category"
    
    func addCategory(category: Category, completion: @escaping (Bool) -> Void) {
        let currentUserUID = Auth.auth().currentUser?.uid ?? ""
        
        let data: [String: Any] = ["name": category.name,
                                   "color": category.color,
                                   "icon": category.icon,
                                   "category_Type": category.categoryType.name,
                                   "isArchived": Bool(category.isArchived)]
        
        //        Firestore.firestore().collection(collectionName).document()
        
        let docPath = Firestore.firestore().collection("users").document(currentUserUID).collection(collectionName)
        docPath.document().setData(data) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                completion(false)
            }
            
            completion(true)
            print("DEBUG: New Category added successfully")
        }
    }
    
    func fetchCategoriesWithCompletion(completion: @escaping ([Category]) -> Void) {
        let currentUserUID = Auth.auth().currentUser?.uid ?? ""
        
        let docPath = Firestore.firestore().collection("users").document(currentUserUID).collection(collectionName)
        docPath.getDocuments { snapshot, error in
            guard error == nil else {
                print("DEBUG: Error - \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let snapshot = snapshot else {
                print("DEBUG: Snapshot is nil")
                return
            }
            var categories = [Category]()
            
            for doc in snapshot.documents {
                let new = Category(id: doc.documentID,
                                name: doc["name"] as? String ?? "",
                                color: doc["color"] as? String ?? "",
                                icon: doc["icon"] as? String ?? "",
                                   categoryType: TransactionType(rawValue: (doc["categoryType"] as? TransactionType ?? .expense).rawValue)!,
                                isArchived: doc["icon"] as? Bool ?? false)
                categories.append(new)
            }
            completion(categories)
         }
    }
    
    func fetchCategories() {
        Firestore.firestore().collection(collectionName).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            documents.forEach { doc in
                print(doc.data())
            }
        }
    }
}
