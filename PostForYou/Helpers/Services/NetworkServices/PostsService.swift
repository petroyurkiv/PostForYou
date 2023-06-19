//
//  NetworkService.swift
//  PostForYou
//
//  Created by Petro on 17.06.2023.
//

import Foundation

enum PostsService {
    static func fetchPosts(completion: @escaping(([Post]) -> Void)) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode([Post].self, from: data)
                completion(result)
            } catch {
                print("\(error)")
            }
        }
        task.resume()
    }
}
