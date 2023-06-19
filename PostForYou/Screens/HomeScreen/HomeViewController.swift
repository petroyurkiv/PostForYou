//
//  ViewController.swift
//  PostForYou
//
//  Created by Petro on 13.06.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModelProtocool
    
    var posts = [Post]()
    
    private let bar = UIView()
    private let searchBar = TextField()
    private var tableView = UITableView()
    
    init(viewModel: HomeViewModelProtocool) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        configureNavigationBar()
        configureBarView()
        configureSearchBar()
        configureTableView()
        
        UserService.fetchUsers { user in
            print(user)
        }
        
        viewModel.onRefresh = { [weak self] posts in
            guard let self else { return }
            self.posts = posts
            self.tableView.reloadData()
        }
        
        viewModel.fetchData()
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.backgroundColor = Colors.titleColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.barColor]
    }
    
    private func configureBarView() {
        view.addSubview(bar)
        bar.backgroundColor = Colors.barColor
        bar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 46)
        bar.center.x = view.center.x
    }

    private func configureSearchBar() {
        view.addSubview(searchBar)
        searchBar.frame = CGRect(x: 0, y: 0, width: view.frame.width - 32, height: 36)
        searchBar.center = bar.center
        searchBar.backgroundColor = Colors.texFieldColor
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.separatorColor = .white
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        setTableViewContraints()
    }
    
    private func setTableViewContraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: bar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -46)
        ])
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(UserViewController(), animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let model = posts[indexPath.row]
        cell.userIcon.image = UIImage(named: "userImage")
        cell.userName.text = "Bred"
        cell.text.text = model.body
        return cell
    }
}
