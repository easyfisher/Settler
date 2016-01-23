//
//  InnerFire.swift
//  Settler
//
//  Created by Easter on 1/23/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class InnerFire: Skill {
    override func processBattle(ally: Team, enemy: Team) {
        let innerFireBuff1 = InnerFireBuff1()
        let innerFireBuff2 = InnerFireBuff2()
        for member in ally.members {
            if !member.hasBuff(innerFireBuff1) && !member.hasBuff(innerFireBuff2) {
                member.addBuff(innerFireBuff1)
                member.addBuff(innerFireBuff2)
                break
            }
        }
    }
}