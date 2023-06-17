//
//  CollectionViewCell.swift
//  PostForYou
//
//  Created by Petro on 13.06.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    private let backView = UIView()
    private let messageView = UIView()
    let userIcon = UIImageView()
    let userName = UILabel()
    let text = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBackView()
        configureMessegeImage()
        configureUserIcon()
        configureUserName()
        configureText()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBackView() {
        contentView.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .white
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureMessegeImage() {
        contentView.addSubview(messageView)
        messageView.translatesAutoresizingMaskIntoConstraints = false
        messageView.backgroundColor = Colors.barColor
        NSLayoutConstraint.activate([
            messageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 2),
            messageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 4),
            messageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -4),
            messageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -2)
        ])
        messageView.layer.cornerRadius = 16
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
        userIcon.clipsToBounds = true
    }
    
    private func configureUserName() {
        contentView.addSubview(userName)
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.font = Fonts.normal(with: 14)
        userName.textColor = Colors.subtitleColor
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            userName.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 8),
        ])
    }
    
    private func configureText() {
        contentView.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = Fonts.normal(with: 16)
        text.textColor = Colors.titleColor
        text.numberOfLines = 0
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 4),
            text.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 8),
            text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            text.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
}

