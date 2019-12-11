//
//  LoginViewController.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import UIKit
import Coordinatable

public class LoginViewController: UIViewController, Modulable {
    public typealias InputType = None
    public typealias OutputType = LoginModuleResult

    public var output: ((LoginModuleResult) -> Void)?
    var loginStorage: LoginStorageInput!

    let loginButton = UIButton(type: .system)

    public override func loadView() {
        super.loadView()

        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }

        setupLoginButton()
        title = "Login screen"
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func setupLoginButton() {
        view.addSubview(loginButton)

        loginButton.setTitle("Login", for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    @objc private func loginButtonTapped() {
        loginStorage.setLoggedIn(true)
        output?(.loggedIn)
    }
}
