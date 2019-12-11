//
//  MainCoordinator.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import Coordinatable
import UIKit

final class MainCoordinator: WindowCoordinator, Coordinatable {
    public typealias StartOption = None
    public typealias OutputType = None

    let coordinatorFactory: CoordinatorFactoring
    let loginStorage: LoginStorageOutut

    public var output: ((None) -> Void)?

    public init(coordinatorFactory: CoordinatorFactoring,
                loginStorage: LoginStorageOutut,
                window: UIWindow) {
        self.coordinatorFactory = coordinatorFactory
        self.loginStorage = loginStorage

        super.init(window: window)
    }

    public func start(with option: None) {
        if loginStorage.isLoggedIn() {
            runMainFlow()
        } else {
            runLoginFlow(animated: false)
        }
    }

    func runLoginFlow(animated: Bool = false) {
        let (coordinator, presentable) = coordinatorFactory.makeLoginCoordinator()

        addDependency(coordinator)

        coordinator.output = { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .loggedIn:
                self.runMainFlow()
            }
        }

        setChildCoordinator((coordinator, presentable), animated: animated)
        coordinator.start(with: .none)
    }

    func runMainFlow() {
        let (coordinator, presentable) = coordinatorFactory.makeTabCoordinator()

        addDependency(coordinator)

        coordinator.output = { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .loggedOut:
                self.runLoginFlow(animated: true)
            }
        }

        setChildCoordinator((coordinator, presentable), animated: true)
        coordinator.start(with: .none)
    }
}

