//
//  Adress.swift
//  PostForYou
//
//  Created by Petro on 19.06.2023.
//

import Foundation

struct Address: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
}
