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
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureVC()
        getFollowers()
    }
    
    func getFollowers() {
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
    
    func configureVC() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        // TODO: refactor
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumSpacing: CGFloat = 10
        
        let aviliableWidth = width - (padding * 2) - (minimumSpacing * 2)
        let itemWidth = aviliableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    

}
