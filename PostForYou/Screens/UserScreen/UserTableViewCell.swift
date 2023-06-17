//
//  UserTableViewCell.swift
//  PostForYou
//
//  Created by Petro on 17.06.2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    static let identifier = "UserTableViewCell"
    
    private let backView = UIView()
    private let sectionView = UIView()
    let systemLabel = UILabel()
    let userLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBackView()
        configureSectionView()
        configureSystemLabel()
        configureUserLabel()
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
    
    private func configureSectionView() {
        contentView.addSubview(sectionView)
        sectionView.translatesAutoresizingMaskIntoConstraints = false
        sectionView.backgroundColor = Colors.barColor
        NSLayoutConstraint.activate([
            sectionView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 2),
            sectionView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            sectionView.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            sectionView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -2)
        ])
        sectionView.layer.cornerRadius = 16
    }
    
    private func configureSystemLabel() {
        contentView.addSubview(systemLabel)
        systemLabel.textColor = Colors.titleColor
        systemLabel.font = Fonts.normal(with: 14)
        systemLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            systemLabel.topAnchor.constraint(equalTo: sectionView.topAnchor),
            systemLabel.leadingAnchor.constraint(equalTo: sectionView.leadingAnchor, constant: 12),
            systemLabel.bottomAnchor.constraint(equalTo: sectionView.bottomAnchor)
        ])
    }
    
    private func configureUserLabel() {
        contentView.addSubview(userLabel)
        userLabel.textColor = Colors.titleColor
        userLabel.font = Fonts.normal(with: 14)
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: sectionView.topAnchor),
            userLabel.trailingAnchor.constraint(equalTo: sectionView.trailingAnchor, constant: -12),
            userLabel.bottomAnchor.constraint(equalTo: sectionView.bottomAnchor)
        ])
    }
}
