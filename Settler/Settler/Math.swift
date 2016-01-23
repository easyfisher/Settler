//
//  Math.swift
//  Settler
//
//  Created by Easter on 1/22/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class Math {
    static func armorRate(value: Double) -> Double {
        if value >= 0 {
            return 1.0 - 1.0/(1.0 + value * 0.07)
        } else {
            let armorRate = 1.0 - 1.0/(1.0 - value * 0.07)
            return -armorRate
        }
    }
    
    static func gamble(rate: Double) -> Bool {
        return arc4random_uniform(10000) < UInt32(10000 * rate)
    }
}
