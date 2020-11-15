//
//  PostsListView.swift
//  Post2
//
//  Created by Alessio Canestrelli on 15/11/20.
//

import SwiftUI

struct PostsListView: View {
    @State var showingNewModal = false
    @State var results = [Post]()
    
    var body: some View {
        NavigationView{
            List(results, id:\.id) { post in
                NavigationLink(destination:PostDetailView(post: post)) {
                    PostRowView(post: post)
                }
            }
            .navigationBarTitle(Text("Posts"))
            .onAppear(perform: loadData)
            .navigationBarItems(trailing: addButton)
        }
    }
    
    func loadData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Post].self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    private var addButton: some View {
        return AnyView(
            Button(action: onAdd) {
                Image(systemName: "plus")
            }
            .sheet(isPresented: $showingNewModal) {
                NewPostView(isPresented: self.$showingNewModal)
            }
        )
    }
        
    func onAdd() {
        self.showingNewModal.toggle()
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView()
    }
}
