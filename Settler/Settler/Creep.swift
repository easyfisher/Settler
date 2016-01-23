//
//  Creep.swift
//  Settler
//
//  Created by Easter on 1/22/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class Creep: Unit {
    override init() {
        super.init()
        name = "Creep"
        level = 2
        addSkill(Chop())
    }
}