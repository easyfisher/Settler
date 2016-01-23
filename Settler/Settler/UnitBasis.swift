//
//  UnitBasis.swift
//  Settler
//
//  Created by Easter on 1/23/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class UnitBasis {
    let crit: Double = 0.1
    let critDamage: Double = 2
    
    let accPoint: Double = 0
    let baseDodge: Double = 0.1
    let dodgePoint: Double = 0
    let speed: Double = 10
    
    var level: Int = 1
    
    var hitPoint:Double {
        return Double(level) * 100
    }
    var damage:Double {
        return Double(level) * 10
    }
    var armor: Double {
        return Double(level) * 1
    }
}