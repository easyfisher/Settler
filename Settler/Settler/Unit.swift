//
//  Unit.swift
//  Settler
//
//  Created by Easter on 1/15/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class Unit {
    var skillPoint: Double = 0
    var hitPoint: Double = 0
    var name: String
    
    weak var team: Team?
    var basis = UnitBasis()
    var alife: Bool {
        return hitPoint > 0
    }
    
    init() {
        name = ""
        basis.level = 1
        hitPoint = basis.hitPoint
    }
    
    func attack(team: Team) {
        for member in team.members {
            if member.alife {
                member.hitPoint -= basis.damage
                print("\(name) of team \(team.name) did \(basis.damage) damage to \(member.name) of team \(member.team?.name)")
                break
            }
        }
    }
    
    func restore() {
        hitPoint = basis.hitPoint
        skillPoint = 0
    }
    
    class UnitBasis {
        let baseHitPoint:Double = 10
        let baseDamage:Double = 1
        let baseCrit:Double = 0
        let baseCritDamage:Double = 2
        let baseArmor:Double = 0
        let baseAccurate:Double = 1
        let baseDodge:Double = 0
        let baseSpeed:Double = 10
        
        let dHitPoint:Double = 10
        let dDamage:Double = 1
        let dCrit:Double = 0
        let dCritDamage:Double = 0
        let dArmor:Double = 0.2
        let dAccurate:Double = 0
        let dDodge:Double = 0
        let dSpeed:Double = 0
        
        var level: Int = 1
        
        var hitPoint:Double {
            return baseHitPoint + Double(level) * dHitPoint
        }
        var damage:Double {
            return baseDamage + Double(level) * dDamage
        }
        var crit:Double {
            return baseCrit + Double(level) * dCrit
        }
        var critDamage:Double {
            return baseCritDamage + Double(level) * dCritDamage
        }
        var armor:Double {
            return baseArmor + Double(level) * dArmor
        }
        var accurate:Double {
            return baseAccurate + Double(level) * dAccurate
        }
        var dodge:Double {
            return baseDodge + Double(level) * dDodge
        }
        var speed:Double {
            return baseSpeed + Double(level) * dSpeed
        }
    }
}
