//
//  AuthViewModel.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 23/01/23.
//

import Foundation
import Firebase
import FirebaseFirestore

enum ViewState: String, Equatable {
    case signIn, signUp, none
}

enum AuthState: Equatable {
    case authenticated, notAuthenticated(state: ViewState)
}

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var authState: AuthState? = nil
//    @Published var isPresentedAlert: Bool = false
//    @Published var alertInfo: AlertInfo = AlertInfo(title: "", decription: "")
    @Published var currentUser: User?
    private var db = Firestore.firestore()
    private let service = UserService()
    
    init() {
//        Auth.auth().addStateDidChangeListener { auth, user in
//            self.userSession = auth.currentUser
//            self.authState = user != nil ? .authenticated : .notAuthenticated(state: .none)
//            self.fetchUser()
//        }
//
//        print("DEBUG: USER state: \(String(describing: authState))")
//        print("DEBUG: User session is \(String(describing: self.userSession))")
        
        isUserSignedIn()
    }
    
    func isUserSignedIn() {
        userSession = Auth.auth().currentUser
        self.authState = userSession != nil ? .authenticated : .notAuthenticated(state: .none)
        self.fetchUser()
        
        print("DEBUG: USER state: \(String(describing: authState))")
        print("DEBUG: User session is \(String(describing: self.userSession))")
    }
    
    //MARK: login existing user
    func login(withEmail email: String, password: String) {
        print("DEBUG: Login with email - \(email)")
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.authState = .authenticated
            self.fetchUser()
            print("DEBUG: User Logged in successfully")
        }
    }
    
    //MARK: Creating new user
    func register(withEmail email: String, password: String, fName: String, lName: String) {
        print("DEBUG: Register with email - \(email)")
        
        //Email - Email must be in email format
        //Pwd - The password must be 6 characters long or more.
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.authState = .authenticated
            self.fetchUser()
            print("DEBUG: User registered successfully")
            print("DEBUG: User is \(String(describing: self.userSession))")
            
            let data = ["firstName": fName,
                        "lastName": lName,
                        "email": email,
                        "uid": user.uid]
            
            self.db.collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: Uploaded user data")
                }
        }
    }
    
    //BUG not
    //MARK: SignOut
    func signOut() {
        self.authState = .notAuthenticated(state: .signIn)
        self.userSession = nil
        print("DEBUG: USER state: \(String(describing: authState))")
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        print("DEBUG: \(self.userSession?.uid ?? "nil")")
        guard let uid = self.userSession?.uid else { return }
        
        print("\(String(describing: currentUser))")
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
            print("DEBUG: \(String(describing: self.currentUser))")
        }
    }
    
    
    //MARK: Show Alert
//    func showAlertWith(title: String, decription: String) {
//        DispatchQueue.main.async { [weak self] in
//            self?.alertInfo.title = title
//            self?.alertInfo.decription = decription
//            self?.isPresentedAlert = true
//        }
//    }
}
