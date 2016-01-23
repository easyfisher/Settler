//
//  WithStandBuff.swift
//  Settler
//
//  Created by Easter on 1/23/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class WithStandBuff: Buff {
    init() {
        super.init(value: 5, property: .ArmorPoint, type: .Mod)
    }
}