//
//  SearchVC+UITextFieldDelegate.swift
//  GHUsers
//
//  Created by Denis Nefedov on 17.01.2020.
//  Copyright © 2020 X. All rights reserved.
//

import UIKit

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushUserListVC()
        return true
    }

}
