//
//  ContactsModulesFactoring.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import Coordinatable

public protocol ContactsModulesFactoring {
    func makeContactsListScreen() -> ModulableFactoryResult<ContactsListModuleInput, ContactsListModuleResult>
    func makeContactScreen() -> ModulableFactoryResult<ContactModuleInput, None>
}
