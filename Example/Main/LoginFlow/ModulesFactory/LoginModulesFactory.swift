//
//  LoginModulesFactory.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import Coordinatable

public struct LoginModulesFactory: LoginModulesFactoring {
    private let loginStorage: LoginStorageInput

    public init(loginStorage: LoginStorageInput) {
        self.loginStorage = loginStorage
    }

    public func makeLoginScreen() -> ModulableFactoryResult<None, LoginCoordinatorResult> {
        let loginViewController = LoginViewController()
        loginViewController.loginStorage = loginStorage

        return (module: AnyModulable(loginViewController), presentable: loginViewController)
    }
}
