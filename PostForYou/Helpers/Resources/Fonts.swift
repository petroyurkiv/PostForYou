//
//  Fonts.swift
//  PostForYou
//
//  Created by Petro on 16.06.2023.
//

import UIKit

enum Fonts {
    static func bold(with size: CGFloat) -> UIFont {
        UIFont(name: "Kailasa-Bold", size: size) ?? UIFont()
    }
    static func normal(with size: CGFloat) -> UIFont {
        UIFont(name: "Kailasa", size: size) ?? UIFont()
    }
}
