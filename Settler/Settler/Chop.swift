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
            var damage = unit.status.damage
            if (Math.gamble(unit.status.crit)) {
                damage *= unit.status.critDamage
            }
            let finalDamage = target.takeStrike((damage, unit.status.accPoint))
            print("\(unit.name) of team \(ally.name) did \(finalDamage) damage to \(target.name) of team \(enemy.name)")
        }
    }
}
