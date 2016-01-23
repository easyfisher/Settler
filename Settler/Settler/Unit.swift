//
//  Unit.swift
//  Settler
//
//  Created by Easter on 1/15/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class Unit {
    var name: String
    unowned var team: Team = Team()
    var skills: [Skill] = [Skill]()
    var actionProgress: Double = 0
    var actionPoint: Int = 0
    
    var status = UnitStatus()
    var alife: Bool {
        return status.hitPoint > 0
    }
    var isCharged: Bool {
        return actionPoint > 0
    }
    var level: Int {
        set {
            status.basis.level = newValue
            status.initProperties()
        }
        get {
            return status.basis.level
        }
    }
    
    init() {
        name = ""
    }
    
    func prepareBattle(enemy: Team) {
        for skill in skills {
            skill.prepareBattle(team, enemy: enemy)
        }
    }
    
    func attack(enemy: Team) {
        if actionPoint <= 0 {
            return
        }
        if !enemy.alife {
            return
        }
        actionPoint--
        
        for skill in skills {
            skill.processBattle(team, enemy: enemy)
        }
    }
    
    func charge() {
        actionProgress += status.speed
        if actionProgress >= 100 {
            actionProgress %= 100
            actionPoint++
        }
    }
    
    func restore() {
        status.restore()
        actionProgress = 0
        actionPoint = 0
    }
    
    func takeDamage(strike: (damage: Double, accPoint: Double)) -> Double {
        if (Math.gamble(status.dodgeRate(strike.accPoint))) {
            return 0
        }
        
        let damage = strike.damage * (1 - status.armorRate)
        status.hitPoint -= damage
        
        return damage
    }
    
    func takeHeal(heal: Double) {
        status.hitPoint += heal
    }
    
    func addSkill(skill: Skill) {
        skills.append(skill)
        skill.unit = self
    }
    
    func addBuff(buff: Buff) {
        status.addBuff(buff)
    }
    
    func hasBuff(buff: Buff) -> Bool {
        return status.hasBuff(buff)
    }
}
