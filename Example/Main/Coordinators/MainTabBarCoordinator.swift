//
//  MainTabBarCoordinator.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import Coordinatable
import UIKit

class MainTabBarCoordinator: TabBarCoordinator, Coordinatable {
    typealias StartOption = None
    typealias OutputType = MainTabBarCoordinatorResult

    var output: ((MainTabBarCoordinatorResult) -> Void)?

    let coordinatorFactory: CoordinatorFactoring

    init(coordinatorFactory: CoordinatorFactoring, tabBarControlller: UITabBarController) {
        self.coordinatorFactory = coordinatorFactory

        super.init(tabBarController: tabBarControlller)
    }

    func start(with option: None) {
        setTabCoordinators([makeContactsCoordinator(), makeSettingsCoordinator()])
    }

    func makeContactsCoordinator() -> CoordinatableFactoryResult<None, None> {
        let navController = UINavigationController()
        let tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        navController.tabBarItem = tabBarItem

        let navigator = Navigator(rootController: navController)

        let (coordinator, presentable) = coordinatorFactory.makeContactsCoordinator(navigator: navigator)

        coordinator.start(with: .none)

        return (coordinator, presentable)
    }

    func makeSettingsCoordinator() -> CoordinatableFactoryResult<None, SettingsCoordinatorResult> {
        let navController = UINavigationController()
        let tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        navController.tabBarItem = tabBarItem

        let navigator = Navigator(rootController: navController)

        let (coordinator, presentable) = coordinatorFactory.makeSettingsCoordinator(navigator: navigator)

        coordinator.output = { [weak self] result in
            switch result {
            case .loggedOut:
                self?.output?(.loggedOut)
            }
        }

        coordinator.start(with: .none)

        return (coordinator, presentable)
    }
}
