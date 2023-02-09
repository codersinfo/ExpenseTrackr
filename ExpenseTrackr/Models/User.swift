//
//  User.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 03/02/23.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let firstName: String
    let lastName: String
    let email: String
}
