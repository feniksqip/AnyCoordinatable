//
//  SettingsViewController.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import UIKit
import Coordinatable

public class SettingsViewController: UIViewController, Modulable {
    public typealias InputType = None
    public typealias OutputType = SettingsModuleResult

    public var output: ((SettingsModuleResult) -> Void)?
    var loginStorage: LoginStorageInput!

    public override func loadView() {
        super.loadView()

        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }

        setupNavBar()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

    }

    func setupNavBar() {
        navigationItem.title = "Settings"

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(logout))
    }

    @objc func logout() {
        loginStorage.setLoggedIn(false)
        output?(.loggedOut)
    }
}
