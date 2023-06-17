//
//  PostsResult.swift
//  PostForYou
//
//  Created by Petro on 17.06.2023.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
