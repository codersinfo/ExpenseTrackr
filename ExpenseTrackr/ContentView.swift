//
//  ContentView.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 22/01/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authVm: AuthViewModel
    
    var body: some View {
            Group {
                switch authVm.authState {
                case .notAuthenticated(let state):
                    if state.rawValue == ViewState.signIn.rawValue {
                        LoginView()
                    } else if state.rawValue == ViewState.signUp.rawValue {
                        RegistrationView()
                    } else {
                        InitialView()
                    }
                case .authenticated:
                    CommonView()
                case .none:
                    InitialView()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let authVm = AuthViewModel()
    
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
        .environmentObject(authVm)
    }
}
