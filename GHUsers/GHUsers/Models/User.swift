//
//  User.swift
//  GHUsers
//
//  Created by Denis Nefedov on 17.01.2020.
//  Copyright © 2020 X. All rights reserved.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var followers: Int
    var following: Int
    var createdAt: String
}
