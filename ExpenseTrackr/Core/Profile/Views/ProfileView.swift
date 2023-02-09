//
//  ProfileView.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 02/02/23.
//

import SwiftUI

struct ProfileView: View {
    @State var isOn: Bool = false
    @EnvironmentObject var authVm: AuthViewModel
    private let user: User
    @Binding var showTabBar: Bool
    
    init(user: User, showTabBar: Binding<Bool>) {
        self.user = user
        self._showTabBar = showTabBar
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    profileHeader
                    Section {
                        Toggle("Categories", isOn: $isOn)
                        
                        NavigationLink {
                            CategoriesView(showTabBar: $showTabBar)
                        } label: {
                            Text("Category")
                        }
                        
                    } header: {
                        Text("Notfic")
                    }
                    
                    Section {
                        Button {
                            authVm.signOut()
                        } label: {
                            Text("Sign out")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static let authVm = AuthViewModel()
    
    static var previews: some View {
        ProfileView(user: User(id: UUID().uuidString, firstName: "Keerthi", lastName: "Chezhiyan", email: "keerthi@gmail.com"), showTabBar: .constant(true))
            .environmentObject(authVm)
    }
}

extension ProfileView {
    var profileHeader: some View {
        HStack {
            if let user = authVm.currentUser {
                Image("flower")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(user.firstName)
                        .font(.headline)
                    Text(user.email)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
