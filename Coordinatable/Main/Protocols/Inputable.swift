//
//  Inputable.swift
//  Coordinatable
//
//  Created by Михаил Игонин on 09.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation

public protocol Inputable: class {
    associatedtype InputType
    func input(_ parameter: InputType)
}

public extension Inputable where InputType == None {
    func input(_ parameter: None) { }
}
