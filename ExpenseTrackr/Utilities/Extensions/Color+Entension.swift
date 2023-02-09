//
//  Color+Entension.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 23/01/23.
//

import Foundation
import SwiftUI
import UIKit

// #e6eaf2
extension Color {
    static let primaryBackground1 = Color("background1")
    static let primaryBackground2 = Color("background2")
    static let primaryBackground3 = Color("background3")
    static let darkColor2 = Color("darkColor2")
    static let darkColor3 = Color("darkColor3")
    static let darkColor4 = Color("darkColor4")
    
    static let primaryColor1 = Color("primaryColor1")
    static let primaryColor2 = Color("primaryColor2")
    static let primaryColor3 = Color("primaryColor3")
    static let primaryColor4 = Color("primaryColor4")
    
    static let disabledTextColor = Color("disabledTextColor")
    static let textColor = Color("textColor1")
    static let textColor2 = Color("textColor2")
    static let textColor3 = Color("textColor3")
    static let textColor4 = Color("textColor4")
    
    static let successColor = Color("successColor")
    static let errorColor = Color("errorColor")
    static let warningColor = Color("warningColor")
    
    static let primaryBackground = Color("primaryPurple")
    static let primaryYellow = Color("primaryYellow")
    static let primaryBlue = Color("primaryBlue")
    static let primaryTeal = Color("primaryTeal")
    static let primaryPink = Color.pink
    static let facebookColor = Color("")
    static let googleColor = Color("")
    static let lightBlue = Color("lightBlue")

}

//extension Color {
//    func stringFromColor(color: Color) -> String {
//        let components = color.cgColor?.components
//        return "[\(components![0]), \(components![1]), \(components![2]), \(components![3])]"
//    }
//
//    func colorFromString(string: String) -> Color {
//        let componentsString = string.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "[", with: "")
//        let components = componentsString.components(separatedBy: ", ")
//        return Color(red: CGFloat((components[0] as NSString).floatValue),
//                     green: CGFloat((components[1] as NSString).floatValue),
//                     blue: CGFloat((components[2] as NSString).floatValue))
//    }
//}

// HEX color
extension Color {
    init?(hex: String) {
        var localHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        localHex = localHex.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        let len = localHex.count
        
        guard Scanner(string: localHex).scanHexInt64(&rgb) else { return nil }
        
        if len == 6 {
            red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            blue = CGFloat(rgb & 0x0000FF) / 255.0
            alpha = 1.0
        } else if len == 8 {
            red = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            green = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            blue = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            alpha = CGFloat(rgb & 0x000000FF) / 255.0
        } else {
            return nil
        }
        
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
