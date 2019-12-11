//
//  FiltersModulesFactory.swift
//  Example
//
//  Created by Михаил Игонин on 11.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import Coordinatable
import UIKit

public class FiltersModulesFactory: FiltersModulesFactoring {
    public func makeContactsFilterScreen() -> ModulableFactoryResult<ContactsFilterModuleInput, ContactsFilterModuleResult> {
        let contactsFilterViewController = ContactsFilterViewController()
        
        return (module: AnyModulable(contactsFilterViewController), presentable: contactsFilterViewController)
    }
}
