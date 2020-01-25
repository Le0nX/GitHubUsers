//
//  GUButton.swift
//  GHUsers
//
//  Created by Denis Nefedov on 03.01.2020.
//  Copyright © 2020 X. All rights reserved.
//

import UIKit

class GUButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal )
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
}
