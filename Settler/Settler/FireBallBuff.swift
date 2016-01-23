//
//  FireBallBuff.swift
//  Settler
//
//  Created by Easter on 1/23/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class FireBallBuff: Buff {
    init() {
        super.init(value: -0.5, property: .Speed, type: .RateMod)
    }
}