//
//  UsersViewController.swift
//  GHUsers
//
//  Created by Denis Nefedov on 17.01.2020.
//  Copyright © 2020 X. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var userName: String!
    var page: Int = 1
    var hasMoreFolloweres = true
    var followers = [Follower]()
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        getFollowers(username: userName, page: page)
        configureCollectionView()
        configureDataSource()
    }
    
    func getFollowers(username: String, page: Int) {
        NetworkManager.shared.getFollowers(for: userName, page: page, completed: { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .failure(let error):
                self.presentAllertOnMainThread(title: "Invalid user data", message: error.rawValue, buttonTitle: "OK")
            case .success(let followers):
                if followers.count < 100 {
                    self.hasMoreFolloweres = false
                }
                self.followers.append(contentsOf: followers)
                self.updateData()
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
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot,animatingDifferences: true)
        }
    }

}

extension UsersViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFolloweres else {
                return
            }
            page += 1
            getFollowers(username: userName, page: page)
        }
    }
}
