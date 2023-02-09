//
//  SampleView.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 23/01/23.
//

import SwiftUI

struct SampleView: View {
    @EnvironmentObject var authVm: AuthViewModel
    
    var body: some View {
        Button("Sign out") {
            
            authVm.signOut()
            //authVm.authState = .notAuthenticated(state: .signIn)
        }
    }
}

struct SampleView_Previews: PreviewProvider {
    static let authVm = AuthViewModel()
    
    static var previews: some View {
        SampleView()
            .environmentObject(authVm)
    }
}
