//
//  Outputable.swift
//  Coordinatable
//
//  Created by Михаил Игонин on 09.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation

public protocol Outputable: class {
    associatedtype OutputType
    var output: ((OutputType) -> Void)? {get set}
}
