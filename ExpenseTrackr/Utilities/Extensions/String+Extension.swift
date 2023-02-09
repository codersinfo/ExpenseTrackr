//
//  String+Extension.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 01/02/23.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailValidationRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailValidationRegex).evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let pwdValidationRegex = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", pwdValidationRegex).evaluate(with: self)
    }
}
