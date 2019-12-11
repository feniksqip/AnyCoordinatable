//
//  AnyCoordinatable.swift
//  Coordinatable
//
//  Created by Mikhail Igonin on 09.12.2019.
//  Copyright © 2019 Mikhail Igonin. All rights reserved.
//

import Foundation

public final class AnyCoordinatable<StartOption, Output>: Coordinatable {
    private let setOutputClosure: (((Output) -> Void)?) -> Void
    private let getOutputClosure: () -> ((Output) -> Void)?
    
    private let startClosure: (StartOption) -> Void

    public init<T: Coordinatable>(_ coordionator: T) where T.StartOption == StartOption, T.OutputType == Output {
        startClosure = { (option) in
            coordionator.start(with: option)
        }

        getOutputClosure = { () -> ((Output) -> Void)? in
            return coordionator.output
        }

        setOutputClosure = { output in
            coordionator.output = output
        }
    }

    public func start(with option: StartOption) {
        startClosure(option)
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
