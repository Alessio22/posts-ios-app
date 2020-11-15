//
//  NewPostView.swift
//  Post2
//
//  Created by Alessio Canestrelli on 13/11/20.
//

import SwiftUI

struct NewPostView: View {
    @Binding var isPresented: Bool
    @State var post: Post = Post(userId: 0, id: 0, title: "", body: "")
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Title")
                .bold()
            TextField("Enter title...", text: $post.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Body")
                .bold()
            TextEditor(text: $post.body)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 0.2)
                )
            Button(action: onSave) {
                Text("Save")
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(5)
        }
        .padding()
        .alert(isPresented: $showingConfirmation) {
            Alert(
                title: Text("Thank you!"),
                message: Text(confirmationMessage),
                dismissButton: .default(Text("OK")) {
                    self.isPresented.toggle()
                    
                }
            )
        }
    }
    
    func onSave() {
        guard let encoded = try? JSONEncoder().encode(post) else {
            print("Failed to encode post")
            return
        }
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        URLSession.shared.dataTask(with: request) { data, response, error in
            // handle the result here.
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            if let decodedPost = try? JSONDecoder().decode(Post.self, from: data) {
                self.confirmationMessage = "Your Post is saved with id: \(decodedPost.id)!"
                self.showingConfirmation = true
            } else {
                print("Invalid response from server")
            }
        }.resume()
    }
    
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(isPresented: .constant(true))
    }
}
