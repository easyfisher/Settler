//
//  Archer.swift
//  Settler
//
//  Created by Easter on 1/15/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class Archer: Hero {
    override init() {
        super.init()
        name = "Archer"
        addSkill(Shoot())
        addSkill(EagleEye())
    }
}