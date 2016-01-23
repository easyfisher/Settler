//
//  Priest.swift
//  Settler
//
//  Created by Easter on 1/15/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class Priest: Hero {
    override init() {
        super.init()
        name = "Priest"
        addSkill(HolyLight())
        addSkill(InnerFire())
    }
}