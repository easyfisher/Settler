//
//  EagleEye.swift
//  Settler
//
//  Created by Easter on 1/23/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class EagleEye: Skill {
    override func prepareBattle(ally: Team, enemy: Team) {
        unit.addBuff(EagleEyeBuff1())
        unit.addBuff(EagleEyeBuff2())
    }
}