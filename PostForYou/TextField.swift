//
//  TextField.swift
//  PostForYou
//
//  Created by Petro on 13.06.2023.
//

import UIKit

class TextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        confTextField()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func confTextField() {
        placeholder = "Search"
        textColor = Colors.subtitleColor
        layer.cornerRadius = 18
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
}
