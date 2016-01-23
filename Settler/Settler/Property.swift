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
    var linearMods: [Double] = [Double]()
    var mods: [Double] = [Double]()
    var value: Double {
        var totalLinearMod = 0.0
        for linearMod in linearMods {
            totalLinearMod += linearMod
        }
        var totalMod = 0.0
        for mod in mods {
            totalMod += mod
        }
        return (base + totalLinearMod) * (1 + totalMod)
    }
}