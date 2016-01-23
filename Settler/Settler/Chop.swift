//
//  Chop.swift
//  Settler
//
//  Created by Easter on 1/23/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class Chop: Skill {
    override func processBattle(ally: Team, enemy: Team) {
        if let target = enemy.firstAlifeMember {
            var damage = unit.status.damage.value
            if (Math.gamble(unit.status.crit.value)) {
                damage *= unit.status.critDamage.value
            }
            let finalDamage = target.takeStrike((damage, unit.status.accPoint.value))
            print("\(unit.name) of team \(ally.name) did \(finalDamage) damage to \(target.name) of team \(enemy.name)")
        }
    }
}
