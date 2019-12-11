//
//  CoordinatorFactory.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import UIKit
import Coordinatable

public class CoordinatorFactory: CoordinatorFactoring {
    private let contactsStorage: ContactsStorageOutput
    private let loginStorage: LoginStorageInput

    init(contactsStorage: ContactsStorageOutput, loginStorage: LoginStorageInput) {
        self.contactsStorage = contactsStorage
        self.loginStorage = loginStorage
    }

    public func makeLoginCoordinator() ->
        CoordinatableFactoryResult<None, LoginCoordinatorResult> {

            let navController = UINavigationController()
            let navigator = Navigator(rootController: navController)

            let modulesFactory = LoginModulesFactory(loginStorage: loginStorage)

            let coordinator = LoginCoordinator(modulesFactory: modulesFactory,
                                               navigator: navigator)

            return (AnyCoordinatable(coordinator), navController)
    }

    public func makeTabCoordinator() ->
        CoordinatableFactoryResult<None, MainTabBarCoordinatorResult> {

            let tabBarController = UITabBarController()
            let coordinator = MainTabBarCoordinator(coordinatorFactory: self, tabBarControlller: tabBarController)
            return (AnyCoordinatable(coordinator), tabBarController)
    }

    public func makeContactsCoordinator(navigator: Navigating) ->
        CoordinatableFactoryResult<None, None> {
            let coordinator = ContactsCoordinator(modulesFactory: ContactsModulesFactory(storage: contactsStorage),
                                                  coordinatorFactory: self,
                                                  navigator: navigator)

            return (AnyCoordinatable(coordinator), navigator)
    }

    public func makeFiltersCoordinator() ->
        CoordinatableFactoryResult<FiltersCoordinatorStartOption, FiltersCoordinatorResult> {
            let navController = UINavigationController()
            let navigator = Navigator(rootController: navController)

            let coordinator = FiltersCoordinator(modulesFactory: FiltersModulesFactory(),
                                                 navigator: navigator)
//            let coordinator = StubCoordinator<FiltersCoordinatorStartOption, FiltersCoordinatorResult>(
//                message: "Test filters",
//                navigator: navigator,
//                outputResult: FiltersCoordinatorResult.filtersApplied(FilterSettings(types: [.family]))
//            )

            return (AnyCoordinatable(coordinator), navController)
    }


    public func makeSettingsCoordinator(navigator: Navigating) ->
        CoordinatableFactoryResult<None, SettingsCoordinatorResult> {
            let coordinator = SettingsCoordinator(modulesFactory: SettingsModulesFactory(loginStorage: loginStorage),
                                                  navigator: navigator)

            return (AnyCoordinatable(coordinator), navigator)

    }
}
