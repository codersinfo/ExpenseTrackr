//
//  LoginView.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 22/01/23.
//

import SwiftUI


struct LoginView: View {
    @EnvironmentObject var authVm: AuthViewModel
    //@Binding var currentViewState: ViewState
    
    @State var txtEmail: String = ""
    @State var txtPassword: String = ""
    @State var isChecked: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Text("Sign In")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            //MARK: Email txt
            IconTextField("Email", icon: "envelope", text: $txtEmail)
            
            //MARK: Password Txt
            IconSecureField("Password", icon: "lock", text: $txtPassword)
            
            HStack {
                //MARK: Remember Me
                Toggle("Remember me", isOn: $isChecked)
                    .toggleStyle(CheckboxToggleStyle())
                
                Spacer()
                
                //MARK: Forgot Password
                Button("Forgot Password?") {
                    //Forgor pwd here
                }
                .foregroundColor(.primaryBackground)
            }
            
            //MARK: Login Button
            Button {
                withAnimation {
                    authVm.login(withEmail: txtEmail, password: txtPassword)
                }
            } label: {
                Text("Sign In")
                    .foregroundColor(.white).bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryBackground)
                    .cornerRadius(12)
            }
            
            //MARK: Socialmedia login
            VStack(spacing: 15) {
                Text("Or Sign in with")
                    .bold()
                
                HStack {
                    // need to replace with google image
                    Button("Google") {
                        //Google login here
                    }
                    .buttonStyle(IconButtonStyle(bgColor: .pink.opacity(0.2), icon: "ExampleImg"))
                    
                    // need to replace with facebook image
                    Button("Facebook") {
                        //Facebook login here
                    }
                    .buttonStyle(IconButtonStyle(bgColor: .purple.opacity(0.2), icon: "ExampleImg"))
                }
            }
            
            Spacer()
            
            //MARK: Register new user
            Button {
                authVm.authState = .notAuthenticated(state: .signUp)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.black)
                    
                    Text("Sign Up")
                        .foregroundColor(.primaryBackground)
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
        }
        .padding()
        .toolbar(.hidden)
    }
}

struct LoginView_Previews: PreviewProvider {
    static let authVm = AuthViewModel()
    
    static var previews: some View {
        NavigationStack {
            LoginView()
        }
        .environmentObject(authVm)
    }
}
