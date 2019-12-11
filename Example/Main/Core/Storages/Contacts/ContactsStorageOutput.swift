//
//  ContactsStorageOutput.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation

public protocol ContactsStorageOutput {
    func getContacts(filter: FilterSettings) -> [Contact]
}
