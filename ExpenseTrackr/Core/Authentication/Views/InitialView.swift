//
//  InitialView.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 24/01/23.
//

import SwiftUI

struct InitialView: View {
    @EnvironmentObject var authVm: AuthViewModel
    
    var body: some View {
        VStack {
            Button {
                withAnimation {
                    authVm.authState = .notAuthenticated(state: .signIn)
                }
            } label: {
                Text("Sign In")
                    .foregroundColor(.white).bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryBackground)
                    .cornerRadius(12)
            }

            Button {
                withAnimation {
                    authVm.authState = .notAuthenticated(state: .signUp)
                }
            } label: {
                Text("Sign Up")
                    .foregroundColor(.white).bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryBackground)
                    .cornerRadius(12)
            }
        }
        .padding()
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
