//
//  User.swift
//  PostForYou
//
//  Created by Petro on 19.06.2023.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}
