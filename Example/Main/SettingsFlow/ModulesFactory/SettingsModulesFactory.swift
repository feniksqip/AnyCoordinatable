//
//  SettingsModulesFactory.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import Coordinatable

public struct SettingsModulesFactory: SettingsModulesFactoring {
    let loginStorage: LoginStorageInput

    public init(loginStorage: LoginStorageInput) {
        self.loginStorage = loginStorage
    }

    public func makeSettingsScreen() -> ModulableFactoryResult<None, SettingsCoordinatorResult> {
        let settingsViewController = SettingsViewController()
        settingsViewController.loginStorage = loginStorage

        return (module: AnyModulable(settingsViewController), presentable: settingsViewController)
    }
}
