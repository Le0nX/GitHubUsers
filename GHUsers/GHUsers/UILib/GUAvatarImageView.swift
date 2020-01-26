//
//  GUAvatarImageView.swift
//  GHUsers
//
//  Created by Denis Nefedov on 26.01.2020.
//  Copyright © 2020 X. All rights reserved.
//

import UIKit

class GUAvatarImageView: UIImageView {
    
    let placeHolderImage = UIImage(named: "avatar-placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
    }

}
