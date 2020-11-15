//
//  ProfileView.swift
//  Post2
//
//  Created by Alessio Canestrelli on 15/11/20.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var user: User
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                HStack {
                    Text("Username:")
                        .bold()
                    Text(user.username)
                }
                Spacer()
                Button(action: doLogout) {
                    Text("Esci")
                        .frame(maxWidth: .infinity)
                }
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            .navigationBarTitle(Text("Profilo"))
        }
    }
    
    func doLogout() {
        self.user.isLoggedIn = false
        self.user.username = ""
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User())
    }
}
