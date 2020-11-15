//
//  LoginView.swift
//  Post2
//
//  Created by Alessio Canestrelli on 15/11/20.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var user: User
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.black)
            
            VStack {
                VStack {
                    Title(text: "Welcome!")
                    Image("logo")
                        .frame(height: 150)
                        .clipped()
                }
                .padding()
                
                VStack(alignment: .leading) {
                    TextField("Username", text:     $username)  .textFieldStyle (RoundedBorderTextFieldStyle())
                    TextField("Password", text:     $password)  .textFieldStyle (RoundedBorderTextFieldStyle())
                        .textContentType(.password)
                    Button(action: doLogin) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
            }
        }
        .frame(height: 250)
        .padding()
    }
    
    func doLogin() {
        user.isLoggedIn = true
        user.username = self.username
    }
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView(user: User())
    }
}

struct Title: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}
