//
//  ContactViewController.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation
import UIKit
import Coordinatable

public class ContactViewController: UIViewController, Modulable {
    public typealias InputType = ContactModuleInput
    public typealias OutputType = None

    public var output: ((None) -> Void)?

    var contact: Contact!

    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    public func input(_ parameter: ContactModuleInput) {
        switch parameter {
        case .contact(let contact):
            self.contact = contact
        }
    }
}
