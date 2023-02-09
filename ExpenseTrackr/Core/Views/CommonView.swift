//
//  CommonView.swift
//  ExpenseTrackr
//
//  Created by Priya Shankar on 27/01/23.
//

import SwiftUI

struct CommonView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var showTabBar = true
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var tab: Tab = .home
    
    var body: some View {
        if let user = authVM.currentUser {
            ZStack(alignment: .bottom) {
                TabView(selection: $tab) {
                    HomeView()
                        .tag(Tab.home)
                    
                    Text("Transaction")
                        .tag(Tab.transaction)
                    
                    AddView()
                        .tag(Tab.add)
                    
                    Text("Analysis")
                        .tag(Tab.analysis)
                    
                    ProfileView(user: user, showTabBar: $showTabBar)
                        .tag(Tab.profile)
                }
                if showTabBar {
                    VStack {
                        Spacer()
                        CustomTabBar(currentTab: $tab)
                    }
                }
            }
            //.ignoresSafeArea()
        }
    }
}

struct CommonView_Previews: PreviewProvider {
    static let authVm = AuthViewModel()
    
    static var previews: some View {
        CommonView()
            .environmentObject(authVm)
    }
}
