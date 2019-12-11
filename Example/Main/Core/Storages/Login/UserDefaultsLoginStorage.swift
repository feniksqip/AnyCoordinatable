//
//  UserDefaultsLoginStorage.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation

public struct UserDefaultsLoginStorage: LoginStorageInput, LoginStorageOutut {
    private let userDefaults: UserDefaults
    private let kLoggedInKey = "kLoggedInKey"

    //MARK: Init
    public init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    //MARK: Input
    public func setLoggedIn(_ loggedIn: Bool) {
        userDefaults.set(loggedIn, forKey: kLoggedInKey)
    }

    //MARK: Output
    public func isLoggedIn() -> Bool {
        return userDefaults.bool(forKey: kLoggedInKey)
    }
}
