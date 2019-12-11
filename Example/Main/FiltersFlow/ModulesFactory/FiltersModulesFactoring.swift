//
//  FiltersModulesFactoring.swift
//  Example
//
//  Created by Михаил Игонин on 11.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import Coordinatable

public protocol FiltersModulesFactoring {
    func makeContactsFilterScreen() -> ModulableFactoryResult<ContactsFilterModuleInput, ContactsFilterModuleResult>
}
