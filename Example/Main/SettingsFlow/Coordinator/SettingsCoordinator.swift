//
//  SettingsCoordinator.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import Coordinatable

public final class SettingsCoordinator: NavigationCoordinator, Coordinatable {
    public typealias StartOption = None
    public typealias OutputType = SettingsCoordinatorResult

    let modulesFactory: SettingsModulesFactoring
    public var output: ((SettingsCoordinatorResult) -> Void)?

    public init(modulesFactory: SettingsModulesFactoring,
                navigator: Navigating) {
        self.modulesFactory = modulesFactory

        super.init(navigator: navigator)
    }

    public func start(with option: StartOption) {
        super.start()

        let (module, presentable) = modulesFactory.makeSettingsScreen()

        module.output = { [weak self] result in
            self?.output?(result)
        }

        push(presentable, animated: false)
    }
}
