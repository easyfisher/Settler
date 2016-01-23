//
//  Wizard.swift
//  Settler
//
//  Created by Easter on 1/15/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class Wizard: Hero {
    override init() {
        super.init()
        name = "Wizard"
        addSkill(FireBall())
    }
}