//
//  AppDelegate.swift
//  Example
//
//  Created by Михаил Игонин on 09.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import UIKit
import Coordinatable

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var applicationCoordinator: AnyCoordinatable = self.makeMainCoordinator()

    lazy var rootNavigationController: UINavigationController = {
        let navigationController = UINavigationController()

        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()

        return navigationController
    }()

    func makeMainCoordinator() -> AnyCoordinatable<None, None> {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()

        self.window = window

        let coordinatorFactory = CoordinatorFactory(
            contactsStorage: Storages.contactsStorage,
            loginStorage: Storages.loginStorage
        )

        let coordinator = MainCoordinator(coordinatorFactory: coordinatorFactory,
                                          loginStorage: Storages.loginStorage,
                                          window: window)

        return AnyCoordinatable(coordinator)
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow(frame: UIScreen.main.bounds)

        applicationCoordinator.start(with: .none)

        return true
    }

}

