//
//  Post.swift
//  Post2
//
//  Created by Alessio Canestrelli on 13/11/2020.
//

import SwiftUI

struct Post: Hashable, Codable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
