//
//  UsersService.swift
//  PostForYou
//
//  Created by Petro on 19.06.2023.
//

import Foundation

enum UserService {
    static func fetchUsers(completion: @escaping (([User]) -> Void)) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode([User].self, from: data)
                completion(result)
                print(result)
            } catch {
                print("\(error)")
            }
        }
        task.resume()
    }
}
