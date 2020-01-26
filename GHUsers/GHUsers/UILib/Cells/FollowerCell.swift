//
//  FollowerCell.swift
//  GHUsers
//
//  Created by Denis Nefedov on 26.01.2020.
//  Copyright © 2020 X. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    let avatarImageView = GUAvatarImageView(frame: .zero)
    let usernameLabel = GUTitleLabel(aligment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarUrl)
    }
    
    private func configure(){
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        let padding: CGFloat = 8
        avatarImageView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: padding, paddingLeft: padding, paddingBottom: 0, paddingRight: padding, width: 0, height: 0)
        avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor).isActive = true
        
        usernameLabel.anchor(top: avatarImageView.bottomAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: 12, paddingLeft: padding, paddingBottom: 0, paddingRight: padding, width: 0, height: 20)
    }
}
