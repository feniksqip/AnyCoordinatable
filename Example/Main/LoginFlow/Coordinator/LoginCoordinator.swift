//
//  LoginCoordinator.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import Coordinatable

public final class LoginCoordinator: NavigationCoordinator, Coordinatable {
    public typealias StartOption = None
    public typealias OutputType = LoginCoordinatorResult

    let modulesFactory: LoginModulesFactoring
    public var output: ((LoginCoordinatorResult) -> Void)?

    public init(modulesFactory: LoginModulesFactoring,
                navigator: Navigating) {
        self.modulesFactory = modulesFactory

        super.init(navigator: navigator)
    }

    public func start(with option: StartOption) {
        super.start()

        let (module, presentable) = modulesFactory.makeLoginScreen()

        module.output = { [weak self] result in
            switch result {
            case .loggedIn:
                self?.output?(.loggedIn)
            }
        }

        push(presentable, animated: false)
    }
}
