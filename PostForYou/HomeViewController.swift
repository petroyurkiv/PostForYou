//
//  ViewController.swift
//  PostForYou
//
//  Created by Petro on 13.06.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let bar = UIView()
    private let searchBar = TextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureBarView()
        configureSearchBar()
    }
    
    private func configureBarView() {
        view.addSubview(bar)
        bar.backgroundColor = Colors.barColor
        bar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 46)
        bar.center = view.center
    }

    private func configureSearchBar() {
        view.addSubview(searchBar)
        searchBar.frame = CGRect(x: 0, y: 0, width: view.frame.width - 32, height: 36)
        searchBar.center = view.center
        searchBar.backgroundColor = Colors.texFieldColor
    }
}

