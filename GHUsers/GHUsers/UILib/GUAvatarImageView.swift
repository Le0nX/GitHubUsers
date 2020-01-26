//
//  GUAvatarImageView.swift
//  GHUsers
//
//  Created by Denis Nefedov on 26.01.2020.
//  Copyright © 2020 X. All rights reserved.
//

import UIKit

class GUAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    let placeHolderImage = UIImage(named: "avatar-placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImage(from urlString: String) {
        
        if let image = cache.object(forKey: NSString(string:urlString)) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else {return}
            
            if error != nil { return }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {return}
            guard let data = data else {return}
            
            guard let image = UIImage(data: data) else {return}
            
            self.cache.setObject(image, forKey: NSString(string: urlString))
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
    }

}
