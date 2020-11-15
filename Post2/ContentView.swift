//
//  ContentView.swift
//  Post2
//
//  Created by Alessio Canestrelli on 13/11/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var user = User()
    
    var body: some View {
        TabView {
            PostsListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Posts")
                }
        
            if !user.isLoggedIn {
                LoginView(user: user)
                    .tabItem {
                        Image(systemName: "key")
                        Text("Login")
                    }
            } else {
                ProfileView(user: user)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profilo")
                    }
            }
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
