//
//  Storages.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation

public final class Storages {
    public static let loginStorage: LoginStorageInput & LoginStorageOutut = {
        return UserDefaultsLoginStorage(userDefaults: .standard)
    }()

    public static let contactsStorage: ContactsStorageOutput = {
        return ContactsStorage()
    }()
}
