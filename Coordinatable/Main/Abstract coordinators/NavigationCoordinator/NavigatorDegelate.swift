//
//  NavigatorDegelate.swift
//  Coordinatable
//
//  Created by Mikhail Igonin on 27.11.2019.
//  Copyright © 2019 Mikhail Igonin. All rights reserved.
//

import Foundation

public protocol NavigatorDelegate: class {
    func viewControllerPushed()
    func viewControllerPoped()
    func viewControllerDismissed()
}
