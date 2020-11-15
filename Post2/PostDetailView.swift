//
//  PostDetailView.swift
//  Post2
//
//  Created by Alessio Canestrelli on 13/11/2020.
//

import SwiftUI

struct PostDetailView: View {
    var post: Post
    
    var body: some View {
        
        ScrollView(.vertical) {
            Text(post.body)
        }
        .padding(5)
        .navigationTitle(Text(post.title))
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: Post(
            userId: 1,
            id: 1,
            title: "Titolo 1",
            body: "Body 1"
        ))
    }
}
