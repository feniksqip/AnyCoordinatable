//
//  CoordinatableFactoryResult.swift
//  Coordinatable
//
//  Created by Михаил Игонин on 09.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation

public typealias CoordinatableFactoryResult<StartOption, Output> = (coordinator: AnyCoordinatable<StartOption, Output>, presentable: Presentable)
