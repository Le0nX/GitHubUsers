//
//  UsersViewController.swift
//  GHUsers
//
//  Created by Denis Nefedov on 17.01.2020.
//  Copyright © 2020 X. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    var userName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        NetworkManager.shared.getFollowers(for: userName, page: 1, completed: { result in
            
            switch result {
            case .failure(let error):
                self.presentAllertOnMainThread(title: "Invalid user data", message: error.rawValue, buttonTitle: "OK")
            case .success(let followers):
                print("Followers.count = \(followers.count)")
                print(followers)
            }
        })
    }
    

}
