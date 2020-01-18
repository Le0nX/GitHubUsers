//
//  SearchViewController.swift
//  GHUsers
//
//  Created by Denis Nefedov on 03.01.2020.
//  Copyright © 2020 X. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let logoImage = UIImageView()
    let usernameTextField = GUTextField()
    let actionButton = GUButton(backgroundColor: .systemGreen, title: "Get Users")
    
    private var isUsernameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureLogiImage()
        configureUserTextField()
        configureActionButton()
        createDismissKeyboardRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    @objc
    func pushUserListVC() {
        guard isUsernameEntered else {
            presentAllertOnMainThread(title: "No username", message: "You have not entered any username", buttonTitle: "OK")
            return
        }
        
        let usersVC = UsersViewController()
        usersVC.userName = usernameTextField.text
        usersVC.title = usernameTextField.text
        navigationController?.pushViewController(usersVC, animated: true)
    }
}



extension SearchViewController {
    
    private func createDismissKeyboardRecognizer() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    private func configureLogiImage() {
        view.addSubview(logoImage)
        logoImage.image = UIImage(named: "gh-logo")
        logoImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 80, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 200)
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func configureUserTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        usernameTextField.anchor(top: logoImage.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 48, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 0, height: 50)
        usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func configureActionButton() {
        view.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(pushUserListVC), for: .touchUpInside)
        
        actionButton.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 50, paddingBottom: -50, paddingRight: 50, width: 0, height: 50)
        actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
