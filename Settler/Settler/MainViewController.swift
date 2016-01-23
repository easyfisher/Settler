//
//  MainViewController.swift
//  Settler
//
//  Created by Easter on 8/16/15.
//  Copyright © 2015 Easter. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func duel(sender: AnyObject) {
        print("")
        print("")
        print("############################  Duel start  ############################")
        let team1 = Team("The Wind")
        team1.addMember(Warrior())
        team1.addMember(Archer())
        team1.addMember(Wizard())
        team1.addMember(Priest())
        let team2 = Team("The Wave")
        team2.addMember(Creep())
        team2.addMember(Creep())
        team2.addMember(Creep())
        team2.addMember(Creep())
        let result = Team.processBattle(team1, team2: team2)
        let winner = result > 0 ? team1 : team2
        print("############################  Duel end.  ############################")
        print("Winner is \(winner.name)")
        print("")
        print("")
    }

}
