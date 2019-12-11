//
//  Startable.swift
//  Coordinatable
//
//  Created by Михаил Игонин on 09.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation

public protocol Startable: class {
    associatedtype StartOption
    func start(with option: StartOption)
}
