//
//  Navigating.swift
//  Coordinatable
//
//  Created by Mikhail Igonin on 27.11.2019.
//  Copyright © 2019 Mikhail Igonin. All rights reserved.
//

import Foundation

public protocol Navigating: Presentable {
    var delegate: NavigatorDelegate? { get set }

    func present(_ module: Presentable, animated: Bool)
    func dismissModule(animated: Bool)

    func push(_ module: Presentable, animated: Bool)
    func popModule(animated: Bool)
}
