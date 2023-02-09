//
//  UserService.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 03/02/23.
//

import Firebase
import FirebaseFirestore

struct UserService {
    let db = Firestore.firestore()
    
//    func fetchUser(withUid uid: String, completion: @escaping (User) -> Void) {
//        db.collection("users")
//            .document(uid)
//            .getDocument { snapShot, _ in
//                print("\(snapShot?.data())")
//
//                guard let snapShot = snapShot?.data() else { return }
//                print("\(snapShot)")
//
//                guard let user = try? snapShot.data(as: User.self) else { return }
//                completion(user)
//                print("DEBUG: \(user.email)")
//                print("DEBUG: \(user.firstName)")
//            }
//
//        print("DEBUG: Fetch user info")
//
//    }
    
    func fetchUser(withUid uid: String, completion:@escaping (User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                completion(user)
                
                print("DEBUG: user data is \(user)")
            }
    }
}
