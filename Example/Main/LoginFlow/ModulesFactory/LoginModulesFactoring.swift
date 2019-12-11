//
//  LoginModulesFactoring.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import Coordinatable

public protocol LoginModulesFactoring {
    func makeLoginScreen() -> ModulableFactoryResult<None, LoginModuleResult>
}
