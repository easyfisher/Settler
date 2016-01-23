//
//  MainViewController.swift
//  Settler
//
//  Created by Easter on 8/16/15.
//  Copyright © 2015 Easter. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var team1 = Team("The Wind")
    var team2 = Team("The Wave")

    override func viewDidLoad() {
        super.viewDidLoad()

        team1.addMember(Warrior())
        team1.addMember(Archer())
        team1.addMember(Wizard())
        team1.addMember(Priest())
        
        team2.addMember(Creep())
        team2.addMember(Creep())
        team2.addMember(Creep())
        team2.addMember(Creep())
    }
    
    @IBAction func duel(sender: AnyObject) {
        print("")
        print("")
        print("############################  Duel start  ############################")
        
        let result = Team.processBattle(team1, team2: team2)
        let winner = result > 0 ? team1 : team2
        
        print("############################  Duel end.  ############################")
        print("Winner is \(winner.name)")
        print("")
        print("")
    }

}
