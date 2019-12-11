//
//  Contact.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation

public struct Contact: Hashable {
    let name: String
    let picture: String
    let phone: String
    let notes: String
    let type: ContactType
}
