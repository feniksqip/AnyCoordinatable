//
//  FiltersCoordinator.swift
//  Example
//
//  Created by Михаил Игонин on 11.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import Coordinatable

public final class FiltersCoordinator: NavigationCoordinator, Coordinatable {
    public typealias StartOption = FiltersCoordinatorStartOption
    public typealias OutputType = FiltersCoordinatorResult

    let modulesFactory: FiltersModulesFactoring
    public var output: ((FiltersCoordinatorResult) -> Void)?

    public init(modulesFactory: FiltersModulesFactoring,
                navigator: Navigating) {
        self.modulesFactory = modulesFactory

        super.init(navigator: navigator)
    }

    public func start(with option: StartOption) {
        super.start()

        let (module, presentable) = modulesFactory.makeContactsFilterScreen()
        module.input(option)

        module.output = { [weak self] result in
            self?.output?(result)
        }

        push(presentable, animated: false)
    }

    public override func moduleDismissed() {
        output?(.cancel)
    }
}
