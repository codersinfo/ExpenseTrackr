//
//  RegistrationView.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 22/01/23.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authVm: AuthViewModel
    
    @State var firstNameTxt: String = ""
    @State var lastNameTxt: String  = ""
    @State var emailTxt: String = ""
    @State var passwordTxt: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Text("Create an account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.trailing, 80)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            //MARK: Register form
            Group {
                HStack {
                    IconTextField("First name", icon: "person", text: $firstNameTxt)
                    
                    IconTextField("Last name", icon: "person", text: $lastNameTxt)
                }
                
                IconTextField("Email", icon: "envelope", text: $emailTxt)
                
                IconSecureField("Password", icon: "lock", text: $passwordTxt)
            }
            
            //MARK: Sign up Button
            Button {
                authVm.register(withEmail: emailTxt, password: passwordTxt, fName: firstNameTxt, lName: lastNameTxt)
            } label: {
                Text("Sign up")
                    .foregroundColor(.white).bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryBackground)
                    .cornerRadius(12)
            }
            
            //MARK: Socialmedia login
            VStack(spacing: 15) {
                Text("Or Sign up with")
                    .bold()
                
                HStack {
                    // need to replace with google image
                    Button("Google") {
                        
                    }
                    .buttonStyle(IconButtonStyle(bgColor: .pink.opacity(0.2), icon: "ExampleImg"))
                    
                    // need to replace with facebook image
                    Button("Facebook") {
                        
                    }
                    .buttonStyle(IconButtonStyle(bgColor: .mint.opacity(0.2), icon: "ExampleImg"))
                }
            }
            
            Spacer()
            
            //MARK: Sign in
            Button {
               // dismiss()
                withAnimation {
                    authVm.authState = .notAuthenticated(state: .signIn)
                }
            } label: {
                HStack {
                    Text("Already an have account?")
                        .foregroundColor(.black)
                    
                    Text("Sign In")
                        .foregroundColor(.primaryBackground)
                        .fontWeight(.bold)
                }
                .font(.footnote)
            }
        }
        .padding()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static let authVm = AuthViewModel()
    
    static var previews: some View {
        NavigationStack {
            RegistrationView()
        }
        .environmentObject(authVm)
    }
}
