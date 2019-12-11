//
//  CoordinatorFactoring.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import Coordinatable

public protocol CoordinatorFactoring {
    
    func makeLoginCoordinator() ->
        CoordinatableFactoryResult<None, LoginCoordinatorResult>

    func makeTabCoordinator() ->
        CoordinatableFactoryResult<None, MainTabBarCoordinatorResult>

    func makeContactsCoordinator(navigator: Navigating) ->
        CoordinatableFactoryResult<None, None>

    func makeFiltersCoordinator() ->
        CoordinatableFactoryResult<FiltersCoordinatorStartOption, FiltersCoordinatorResult>

    func makeSettingsCoordinator(navigator: Navigating) ->
        CoordinatableFactoryResult<None, SettingsCoordinatorResult>
}
