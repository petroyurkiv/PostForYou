//
//  HomeViewModel.swift
//  PostForYou
//
//  Created by Petro on 19.06.2023.
//

import Foundation

protocol HomeViewModelProtocool {
    var onRefresh: (([Post]) -> Void)? { get set }
    func fetchData()
}

class HomeViewModel: HomeViewModelProtocool {
    var onRefresh: (([Post]) -> Void)?
    var posts = [String]()
    
    func fetchData() {
        PostsService.fetchPosts { [weak self] result in
            guard let self else { return }
            
            DispatchQueue.main.async {
                for element in result {
//                    print(element)
                    self.posts.append(element.body)
                }
                
                self.onRefresh?(result)
            }
        }
    }
}

