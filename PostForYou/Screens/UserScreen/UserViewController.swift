//
//  UserViewController.swift
//  PostForYou
//
//  Created by Petro on 17.06.2023.
//

import UIKit

final class UserViewController: UIViewController {
    
    private let userImage = UIImageView()
    private let nameLabel = UILabel()
    private let tableView = UITableView()
    private let textField = UITextField()
    
    override func viewDidLoad() {
        title = "User"
        view.backgroundColor = .white
        configureUserImage()
        configureNameLabel()
        configureTableView()
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.backgroundColor = Colors.titleColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.barColor]
    }
    
    private func configureUserImage() {
        view.addSubview(userImage)
        userImage.frame = CGRect(x: 0, y: 24, width: 128, height: 128)
        userImage.center.x = view.center.x
        userImage.layer.cornerRadius = 64
        userImage.clipsToBounds = true
    }
    
    private func configureNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.textColor = Colors.subtitleColor
        nameLabel.font = Fonts.normal(with: 18)
        setNameLabelContraints()
    }
    
    private func setNameLabelContraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 12),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.identifier)
        tableView.separatorColor = .white
        tableView.backgroundColor = .white
        tableView.isScrollEnabled = false
        setTableViewContraints()
    }
    
    private func setTableViewContraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -4)
        ])
    }
}

extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}

extension UserViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        cell.systemLabel.text = "name:"
        cell.userLabel.text = "Bred"
        return cell
    }
}
