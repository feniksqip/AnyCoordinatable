//
//  NavigationCoordinator.swift
//  Coordinatable
//
//  Created by Mikhail Igonin on 27.11.2019.
//  Copyright © 2019 Mikhail Igonin. All rights reserved.
//

import Foundation

open class NavigationCoordinator: BaseCoordinator, NavigatorDelegate {
    public private(set) var modulesInStack: Int = 0

    public var isModulesStackEmpty: Bool {
        return modulesInStack == 0
    }

    public var navigator: Navigating

    public init(navigator: Navigating) {
        self.navigator = navigator
    }

    public func start() {
        navigator.delegate = self
    }

    public func push(_ module: Presentable, animated: Bool) {
        navigator.push(module, animated: animated)
    }

    public func popModule(animated: Bool) {
        navigator.popModule(animated: animated)
    }

    public func present(_ module: Presentable, animated: Bool) {
        navigator.present(module, animated: animated)
    }

    public func dismiss(animated: Bool) {
        navigator.dismissModule(animated: animated)
    }


    public func viewControllerPushed() {
        modulesInStack += 1
    }

    public func viewControllerPoped() {
        modulesInStack -= 1

        if isModulesStackEmpty {
            allModulesPopped()
        }
    }

    public func viewControllerDismissed() {
        moduleDismissed()
    }

    open func allModulesPopped() {
        
    }

    open func moduleDismissed() {

    }
}
