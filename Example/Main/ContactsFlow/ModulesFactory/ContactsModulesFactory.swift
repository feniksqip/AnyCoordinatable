//
//  ContactsModulesFactory.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import Coordinatable
import UIKit

public class ContactsModulesFactory: ContactsModulesFactoring {
    private let storage: ContactsStorageOutput

    public init(storage: ContactsStorageOutput) {
        self.storage = storage
    }

    public func makeContactsListScreen() -> ModulableFactoryResult<ContactsListModuleInput, ContactsListModuleResult> {
        let contactsListViewController = ContactsListViewController()
        contactsListViewController.storage = storage

        return (module: AnyModulable(contactsListViewController), presentable: contactsListViewController)
    }

    public func makeContactScreen() -> ModulableFactoryResult<ContactModuleInput, None> {
        let contactViewController = ContactViewController()

        return (module: AnyModulable(contactViewController), presentable: contactViewController)
    }
}
