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
        
        
        NetworkManager.shared.getFollowers(for: userName, page: 1, completed: { data, error in
            guard let data = data else {
                self.presentAllertOnMainThread(title: "Invalid user data", message: error ?? "Whoops", buttonTitle: "OK")
                return
            }
            
            print("Followers.count = \(data.count)")
            print(data)
        })
    }
    

}
