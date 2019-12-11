//
//  StubCoordinator.swift
//  Coordinatable
//
//  Created by Михаил Игонин on 11.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import UIKit

public final class StubCoordinator<InputType, OutputType>: Coordinatable {
    public var output: ((OutputType) -> Void)?

    private let navigator: Navigating
    private let message: String
    private let outputResult: OutputType

    public init(message: String, navigator: Navigating, outputResult: OutputType) {
        self.navigator = navigator
        self.message = message
        self.outputResult = outputResult
    }

    public func start(with option: InputType) {
        let alertView = UIAlertController(title: "",
                                          message: message,
                                          preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: { [weak self] _ in
                                        guard let self = self else { return }
                                        self.output?(self.outputResult)
        })

        alertView.addAction(okAction)

        navigator.present(alertView, animated: true)
    }
}
