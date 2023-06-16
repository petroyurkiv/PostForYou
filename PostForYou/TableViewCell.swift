//
//  CollectionViewCell.swift
//  PostForYou
//
//  Created by Petro on 13.06.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "Cell"
    
    let bgImage = UIView()
    let userIcon = UIImageView()
    let userName = UILabel()
    let text = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBgImage()
        configureUserIcon()
        configureUserName()
        configureText()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBgImage() {
        contentView.addSubview(bgImage)
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        bgImage.backgroundColor = Colors.barColor
        NSLayoutConstraint.activate([
            bgImage.topAnchor.constraint(equalTo: topAnchor),
            bgImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureUserIcon() {
        contentView.addSubview(userIcon)
        userIcon.contentMode = .scaleAspectFill
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            userIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            userIcon.heightAnchor.constraint(equalToConstant: 42),
            userIcon.widthAnchor.constraint(equalToConstant: 42)
        ])
        userIcon.layer.cornerRadius = 21
    }
    
    private func configureUserName() {
        contentView.addSubview(userName)
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.textColor = Colors.subtitleColor
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            userName.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 8),
        ])
    }
    
    private func configureText() {
        contentView.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .red
        text.numberOfLines = 0
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 4),
            text.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 8),
            text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            text.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
}

