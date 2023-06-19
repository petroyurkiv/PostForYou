//
//  HomeViewModel.swift
//  PostForYou
//
//  Created by Petro on 19.06.2023.
//

import Foundation

class HomeViewModel {
    var onRefresh: (([Post]) -> Void)?
    
    var posts = [String]()
    
    func fetchData() {
        NetworkService.fetchData { [weak self] result in
            guard let self else { return }
            
            DispatchQueue.main.async {
                for element in result {
                    print(element)
                    self.posts.append(element.body)
                }
                
                self.onRefresh?(result)
            }
        }
    }
}

