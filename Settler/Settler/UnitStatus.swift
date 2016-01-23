//
//  UnitStatus.swift
//  Settler
//
//  Created by Easter on 1/23/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class UnitStatus {
    var hitPoint: Double = 0
    
    var basis = UnitBasis()
    var damage: Property
    var speed: Property
    var crit: Property
    var critDamage: Property
    var accPoint: Property
    var armorPoint: Property
    var armorRate: Double {
        return Math.armorRate(armorPoint.value)
    }
    
    init() {
        basis.level = 1
        hitPoint = basis.hitPoint
        damage = Property()
        damage.base = basis.damage
        speed = Property()
        speed.base = basis.speed
        crit = Property()
        crit.base = basis.crit
        critDamage = Property()
        critDamage.base = basis.critDamage
        accPoint = Property()
        accPoint.base = basis.accPoint
        armorPoint = Property()
        armorPoint.base = basis.armor
    }
    
    func restore() {
        hitPoint = basis.hitPoint
    }
    
    func dodgeRate(accurate: Double) -> Double {
        let propertyDodge = basis.dodgePoint >= accurate ? Math.armorRate(basis.dodgePoint - accurate) : -Math.armorRate(accurate - basis.dodgePoint)
        var result = basis.baseDodge + propertyDodge
        if result > 1 {
            result = 1
        } else if result < 0 {
            result = 0
        }
        return result
    }
    
}