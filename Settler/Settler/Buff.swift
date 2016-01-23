//
//  Buff.swift
//  Settler
//
//  Created by Easter on 1/23/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class Buff {
    enum BuffType {
        case Mod
        case RateMod
    }
    var value: Double
    var property: PropertyKey
    var type: BuffType
    init(value: Double, property: PropertyKey, type: BuffType) {
        self.value = value
        self.property = property
        self.type = type
    }
}
