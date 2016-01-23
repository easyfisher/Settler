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
    var properties = Dictionary<String, Property>()
    var basis = UnitBasis()
    var damage: Double {
        var damage = properties[PropertyKey.Damage.rawValue]!.value
        if damage < 0 { damage = 0 }
        return damage
    }
    var speed: Double {
        return properties[PropertyKey.Speed.rawValue]!.value
    }
    var crit: Double {
        return properties[PropertyKey.Crit.rawValue]!.value
    }
    var critDamage: Double {
        return properties[PropertyKey.CritDamage.rawValue]!.value
    }
    var accPoint: Double {
        return properties[PropertyKey.AccPoint.rawValue]!.value
    }
    var armorPoint: Double {
        return properties[PropertyKey.ArmorPoint.rawValue]!.value
    }
    var armorRate: Double {
        return Math.armorRate(armorPoint)
    }
    
    init() {
        basis.level = 1
        hitPoint = basis.hitPoint
        initProperties()
    }
    
    func initProperties() {
        properties[PropertyKey.Damage.rawValue] = Property()
        properties[PropertyKey.Damage.rawValue]!.base = basis.damage
        properties[PropertyKey.Speed.rawValue] = Property()
        properties[PropertyKey.Speed.rawValue]!.base = basis.speed
        properties[PropertyKey.Crit.rawValue] = Property()
        properties[PropertyKey.Crit.rawValue]!.base = basis.crit
        properties[PropertyKey.CritDamage.rawValue] = Property()
        properties[PropertyKey.CritDamage.rawValue]!.base = basis.critDamage
        properties[PropertyKey.AccPoint.rawValue] = Property()
        properties[PropertyKey.AccPoint.rawValue]!.base = basis.accPoint
        properties[PropertyKey.ArmorPoint.rawValue] = Property()
        properties[PropertyKey.ArmorPoint.rawValue]!.base = basis.armor
    }
    
    func restore() {
        hitPoint = basis.hitPoint
        for (_, property) in properties {
            property.mods.removeAll()
            property.rateMods.removeAll()
        }
    }
    
    func addBuff(buff: Buff) {
        if buff.type == Buff.BuffType.Mod  {
           properties[buff.property.rawValue]!.mods.append(buff)
        } else if buff.type == Buff.BuffType.RateMod {
            properties[buff.property.rawValue]!.rateMods.append(buff)
        }
        
    }
    
    func hasBuff(buff: Buff) -> Bool {
        let property = properties[buff.property.rawValue]!
        if buff.type == .Mod {
            for mod in property.mods {
                if buff.dynamicType === mod.dynamicType {
                    return true
                }
            }
        } else if buff.type == .RateMod {
            for mod in property.rateMods {
                if buff.dynamicType === mod.dynamicType {
                    return true
                }
            }
        }
        
        return false
     }
    
    func dodgeRate(accurate: Double) -> Double {
        let propertyDodge = Math.armorRate(basis.dodgePoint - accurate)
        var result = basis.baseDodge + propertyDodge
        if result > 1 {
            result = 1
        } else if result < 0 {
            result = 0
        }
        return result
    }
    
}