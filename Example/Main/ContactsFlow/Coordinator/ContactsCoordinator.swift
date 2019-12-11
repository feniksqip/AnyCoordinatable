//
//  ContactsCoordinator.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import Coordinatable

public final class ContactsCoordinator: NavigationCoordinator, Coordinatable {
    public typealias StartOption = None
    public typealias OutputType = None

    let modulesFactory: ContactsModulesFactoring
    let coordinatorFactory: CoordinatorFactoring

    public var output: ((None) -> Void)?

    private var contactsListModuleInput: ((ContactsListModuleInput) -> Void)?

    public init(modulesFactory: ContactsModulesFactoring,
                coordinatorFactory: CoordinatorFactoring,
                navigator: Navigating) {
        self.modulesFactory = modulesFactory
        self.coordinatorFactory = coordinatorFactory

        super.init(navigator: navigator)
    }

    public func start(with option: StartOption) {
        super.start()

        let (module, presentable) = modulesFactory.makeContactsListScreen()
        contactsListModuleInput = module.input

        module.output = { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .contactSelected(let contact):
                self.showContact(contact)
            case .filterSelected(let settings):
                self.showFilter(settings: settings)
            }
        }

        push(presentable, animated: false)
    }

    private func showContact(_ contact: Contact) {
        let (module, presentable) = modulesFactory.makeContactScreen()
        module.input(.contact(contact))

        push(presentable, animated: true)
    }

    private func showFilter(settings: FilterSettings) {
        let (coordinator, presentable) = coordinatorFactory.makeFiltersCoordinator()

        coordinator.output = { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .filtersApplied(let settings):
                self.contactsListModuleInput?(.filtersChanged(settings))
            case .cancel:
                break
            }

            self.dismiss(animated: true)
            self.removeDependency(coordinator)
        }

        addDependency(coordinator)
        coordinator.start(with: .setFilters(settings))
        present(presentable, animated: true)
    }
}
