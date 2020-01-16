//
//  ViewController+Allert.swift
//  GHUsers
//
//  Created by Denis Nefedov on 17.01.2020.
//  Copyright © 2020 X. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAllertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let allert = GUAllertViewController(alertTitle: title, message: message, buttonTitle: buttonTitle)
            allert.modalPresentationStyle = .overFullScreen
            allert.modalTransitionStyle = .crossDissolve
            self.present(allert, animated: true)
        }
    }
}
