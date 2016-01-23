//
//  EagleEyeBuff.swift
//  Settler
//
//  Created by Easter on 1/23/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class EagleEyeBuff1: Buff {
    init() {
        super.init(value: 2, property: .AccPoint, type: .Mod)
    }
}

class EagleEyeBuff2: Buff {
    init() {
        super.init(value: 0.05, property: .Crit, type: .Mod)
    }
}