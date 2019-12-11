//
//  ContactsListViewController.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import UIKit
import Coordinatable

public class ContactsListViewController: UITableViewController, Modulable {
    enum Section: CaseIterable {
        case first
    }

    public typealias InputType = ContactsListModuleInput
    public typealias OutputType = ContactsListModuleResult

    var storage: ContactsStorageOutput!
    var filters: FilterSettings = FilterSettings(types: nil)

    private let cellReuseIdentifier = "cell"
    private lazy var dataSource = makeDataSource()

    public var output: ((ContactsListModuleResult) -> Void)?

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

        updateData()
    }

    func updateData(animated: Bool = false) {
        let contacts = storage.getContacts(filter: filters)

        var snapshot = NSDiffableDataSourceSnapshot<Section, Contact>()
        snapshot.appendSections([Section.first])
        snapshot.appendItems(contacts, toSection: Section.first)
        dataSource.apply(snapshot, animatingDifferences: animated)

    }

    func setupNavBar() {
        navigationItem.title = "Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filterTapped))
    }

    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.dataSource = dataSource
    }

    @objc func filterTapped() {
        output?(.filterSelected(filters))
    }

    public func input(_ parameter: ContactsListModuleInput) {
        switch parameter {
        case .filtersChanged(let filter):
            self.filters = filter
        }

        updateData(animated: true)
    }

    func makeDataSource() -> UITableViewDiffableDataSource<Section, Contact> {
        let reuseIdentifier = cellReuseIdentifier

        return UITableViewDiffableDataSource(
            tableView: tableView,
            cellProvider: {  tableView, indexPath, contact in
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: reuseIdentifier,
                    for: indexPath
                )

                cell.textLabel?.text = "\(contact.picture) \(contact.name)"
                return cell
            }
        )
    }
}
