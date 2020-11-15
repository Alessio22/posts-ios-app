//
//  User.swift
//  Post2
//
//  Created by Alessio Canestrelli on 15/11/20.
//


import SwiftUI

class User: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var username: String = ""
}
