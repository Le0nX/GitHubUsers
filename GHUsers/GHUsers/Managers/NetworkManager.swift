//
//  NetworkManager.swift
//  GHUsers
//
//  Created by Denis Nefedov on 25.01.2020.
//  Copyright © 2020 X. All rights reserved.
//

import Foundation

public final class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?,String?)->Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "This username created an invalid request")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(nil, "UNable to complete your request")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server")
                return
            }
            
            guard let data = data else {
                completed(nil, "No data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers,nil)
            } catch {
                completed(nil, "JSON parsing fail")
            }
        }
        task.resume()
    }
}
