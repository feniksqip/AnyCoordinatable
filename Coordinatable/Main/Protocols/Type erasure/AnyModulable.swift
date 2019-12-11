//
//  AnyModulable.swift
//  Coordinatable
//
//  Created by Михаил Игонин on 09.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation

public class AnyModulable<Input, Output>: Modulable {

    private let setOutputClosure: (((Output) -> Void)?) -> Void
    private let getOutputClosure: () -> ((Output) -> Void)?

    private let inputClosure: (Input) -> Void

    public init<T: Modulable>(_ module: T) where T.InputType == Input, T.OutputType == Output {
        inputClosure = { (parameter) in
            module.input(parameter)
        }

        getOutputClosure = { () -> ((Output) -> Void)? in
            return module.output
        }

        setOutputClosure = { output in
            module.output = output
        }
    }

    public func input(_ parameter: Input) {
        inputClosure(parameter)
    }


    public var output: ((Output) -> Void)? {
        get {
            return getOutputClosure()
        }

        set {
            setOutputClosure(newValue)
        }
    }
}
