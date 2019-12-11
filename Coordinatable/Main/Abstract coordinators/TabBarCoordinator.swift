//
//  TabBarCoordinator.swift
//  Coordinatable
//
//  Created by Mikhail Igonin on 03.12.2019.
//  Copyright © 2019 Mikhail Igonin. All rights reserved.
//

import Foundation
import UIKit

open class TabBarCoordinator: BaseCoordinator {
    weak var tabBarController: UITabBarController!

    public init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }

    public func setTabCoordinators(_ coordinators: [(AnyObject, Presentable)]) {
        var viewControllers: [UIViewController] = []

        for (coordinator, presentable) in coordinators {
            addDependency(coordinator)
            viewControllers.append(presentable.toPresent())
        }

        tabBarController.setViewControllers(viewControllers, animated: false)
    }
}
