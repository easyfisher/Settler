//
//  InnerFire.swift
//  Settler
//
//  Created by Easter on 1/23/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class InnerFireBuff1: Buff {
    init() {
        super.init(value: 0.1, property: .Damage, type: .RateMod)
    }
}

class InnerFireBuff2: Buff {
    init() {
        super.init(value: 2, property: .ArmorPoint, type: .Mod)
    }
}