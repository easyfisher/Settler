//
//  Team.swift
//  Settler
//
//  Created by Easter on 1/22/16.
//  Copyright © 2016 Easter. All rights reserved.
//

import Foundation

class Team {
    var members = [Unit]()
    var name: String
    var alife: Bool {
        for member in members {
            if member.alife {
                return true
            }
        }
        return false
    }
    var firstAlifeMember: Unit? {
        for member in members {
            if member.alife {
                return member
            }
        }
        
        return nil
    }
    
    init() {
        name = "Team 0"
    }
    
    init(_ name: String) {
        self.name = name
    }
    
    func restore() {
        for member in members {
            member.restore()
        }
    }
    
    func addMember(member: Unit) {
        members.append(member)
        member.team = self
    }
    
    func prepareBattle(enemy: Team) {
        for member in members {
            member.prepareBattle(enemy)
        }
    }
    
    static func processBattle(team1: Team, team2: Team) -> Int {
        team1.restore()
        team2.restore()
        
        team1.prepareBattle(team2)
        team2.prepareBattle(team1)
        
        var turn = 0
        while team1.alife && team2.alife {
            turn++
            for unit in team1.members {
                if unit.alife {
                    unit.charge()
                    if unit.isCharged {
                        unit.attack(team2)
                    }
                }
            }
            
            if !team2.alife {
                return 1
            }
            
            for unit in team2.members {
                if unit.alife {
                    unit.charge()
                    if unit.isCharged {
                        unit.attack(team1)
                    }
                }
            }
            
            if !team1.alife {
                return -1
            }
        }
        
        return 0
    }
}