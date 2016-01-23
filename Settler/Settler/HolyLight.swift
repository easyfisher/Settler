//
//  HolyLight.swift
//  Settler
//
//  Created by Easter on 1/23/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class HolyLight: Skill {
    override func processBattle(ally: Team, enemy: Team) {
        if let target = ally.firstAlifeMember {
            var heal = unit.status.damage
            if (Math.gamble(unit.status.crit)) {
                heal *= unit.status.critDamage
            }
            target.takeHeal(heal)
            print("\(unit.name) of team \(ally.name) did \(heal) heal to \(target.name) of team \(ally.name)")
        }
    }
}