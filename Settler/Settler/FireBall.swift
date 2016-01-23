//
//  FireBall.swift
//  Settler
//
//  Created by Easter on 1/23/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class FireBall: Skill {
    override func prepareBattle(ally: Team, enemy: Team) {
        unit.addBuff(FireBallBuff())
    }
    
    override func processBattle(ally: Team, enemy: Team) {
        if let target = enemy.firstAlifeMember {
            let damageModifier = 2.2
            var damage = unit.status.damage * damageModifier
            if (Math.gamble(unit.status.crit)) {
                damage *= unit.status.critDamage
            }
            let finalDamage = target.takeStrike((damage, unit.status.accPoint))
            print("\(unit.name) of team \(ally.name) did \(finalDamage) damage to \(target.name) of team \(enemy.name)")
        }
    }
}