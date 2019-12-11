//
//  ContactsFilterViewController.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import UIKit
import Coordinatable

class ContactsFilterViewController: UITableViewController, Modulable {
    enum Section: CaseIterable {
        case all
        case filters
    }

    public typealias InputType = ContactsFilterModuleInput
    public typealias OutputType = ContactsFilterModuleResult

    var storage: ContactsStorageOutput!
    var selectedTypes: [ContactType] = []

    private let cellReuseIdentifier = "cell"

    public var output: ((ContactsFilterModuleResult) -> Void)?

    func input(_ parameter: ContactsFilterModuleInput) {
        switch parameter {
        case .setFilters(let filters):
            selectedTypes = filters.types ?? []
        }
    }

    public override func loadView() {
        super.loadView()

        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }

        setupNavBar()
        setupTableView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

    }


    func setupNavBar() {
        navigationItem.title = "Filters"

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(cancel)
        )

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(applyFilters)
        )
    }

    @objc func applyFilters() {
        output?(.filtersApplied(FilterSettings(types: selectedTypes)))
    }

    @objc func cancel() {
        output?(.cancel)
    }

    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section.allCases[section] {
        case .all:
            return 1
        case .filters:
            return ContactType.allCases.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else {
            fatalError()
        }

        switch Section.allCases[indexPath.section] {
        case .all:
            cell.textLabel?.text = "All"
            cell.accessoryType = selectedTypes.isEmpty ? .checkmark : .none
        case .filters:
            let type = ContactType.allCases[indexPath.row]
            cell.textLabel?.text = type.rawValue
            cell.accessoryType = selectedTypes.contains(type) ? .checkmark : .none
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch Section.allCases[indexPath.section] {
        case .all:
            selectedTypes = []
        case .filters:
            let type = ContactType.allCases[indexPath.row]

            if let index = selectedTypes.firstIndex(of: type) {
                selectedTypes.remove(at: index)
            } else {
                selectedTypes.append(type)
            }

            if selectedTypes.count == ContactType.allCases.count {
                selectedTypes = []
            }
        }

        tableView.reloadData()
    }
}
