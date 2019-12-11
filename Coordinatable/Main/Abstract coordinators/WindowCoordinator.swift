//
//  WindowCoordinator.swift
//  Coordinatable
//
//  Created by Mikhail Igonin on 03.12.2019.
//  Copyright © 2019 Mikhail Igonin. All rights reserved.
//

import Foundation
import UIKit

open class WindowCoordinator: BaseCoordinator {
    weak var window: UIWindow!

    public init(window: UIWindow) {
        self.window = window
    }

    public func setChildCoordinator(_ coordinator: (AnyObject, Presentable), animated: Bool) {
        let hasViewControllerBefore = window.rootViewController != nil

        popDependency()

        let (coordinator, presentable) = coordinator
        addDependency(coordinator)

        window.rootViewController = presentable.toPresent()

        if hasViewControllerBefore && animated {
            // A mask of options indicating how you want to perform the animations.
            let options: UIView.AnimationOptions = .transitionFlipFromLeft

            // The duration of the transition animation, measured in seconds.
            let duration: TimeInterval = 0.4

            // Creates a transition animation.
            // Though `animations` is optional, the documentation tells us that it must not be nil. ¯\_(ツ)_/¯
            UIView.transition(with: window, duration: duration, options: options, animations: {})
        }
    }
}
