//
//  Property.swift
//  Settler
//
//  Created by Easter on 1/23/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class Property {
    var base: Double = 0
    var mods = [Buff]()
    var rateMods = [Buff]()
    
    var value: Double {
        var totalMod = 0.0
        for mod in mods {
            totalMod += mod.value
        }
        var totalRateMod = 0.0
        for mod in rateMods {
            totalRateMod += mod.value
        }
        return (base + totalMod) * (1 + totalRateMod)
    }
}

enum PropertyKey: String {
    case Damage = "damage"
    case Speed = "speed"
    case Crit = "crit"
    case CritDamage = "critDamage"
    case AccPoint = "accPoint"
    case ArmorPoint = "armorPoint"
}