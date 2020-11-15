//
//  PostRowView.swift
//  Post2
//
//  Created by Alessio Canestrelli on 13/11/2020.
//

import SwiftUI

struct PostRowView: View {
    var post: Post
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(post.title)
                Text(post.body)
                    .font(.subheadline)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }.padding(10)
    }
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostRowView(
                post: Post(
                    userId: 1,
                    id: 1,
                    title: "Titolo 1",
                    body: "Body 1"
                )
            )
            PostRowView(
                post: Post(
                    userId: 2,
                    id: 2,
                    title: "Titolo 2",
                    body: "Body 2"
                )
            )
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
