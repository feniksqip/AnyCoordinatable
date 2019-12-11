//
//  Presentable.swift
//  Coordinatable
//
//  Created by Mikhail Igonin on 27.11.2019.
//  Copyright © 2019 Mikhail Igonin. All rights reserved.
//

import Foundation
import UIKit

public protocol Presentable {
    func toPresent() -> UIViewController
}

extension UIViewController: Presentable {
    public func toPresent() -> UIViewController {
        return self
    }
}
