//
//  ViewController.swift
//  iRockPaperScissors
//
//  Created by Marty Avedon on 9/29/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pickerButton: UISegmentedControl!
    @IBOutlet weak var playmoji: UILabel!
    @IBOutlet weak var compoji: UILabel!
    @IBOutlet weak var results: UILabel!
    
    @IBOutlet weak var currentRound: UILabel!
    @IBOutlet weak var playerWins: UILabel!
    @IBOutlet weak var playerLosses: UILabel!
    
    var rounds = 0
    var wins = 0
    var losses = 0
    
    var playerPlaysThis: (weapon: Weapon, emoji: String)?
    var compPlaysThat: (weapon: Weapon, emoji: String)?

    override func viewDidLoad() {
        super.viewDidLoad()
        // increase font size on picker
        let font = UIFont.systemFont(ofSize: 30)
        pickerButton.setTitleTextAttributes([NSFontAttributeName: font], for: .normal)
        // turn emojis sideways
        playmoji.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        compoji.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
    }
    
    // MARK: - Actions
    
    @IBAction func pickerButtons(_ sender: UISegmentedControl) {
        playerPlaysThis = chosenByPlayer(pickerButton.selectedSegmentIndex) as (weapon: Weapon, emoji: String)
        compPlaysThat = chooseForComputer() as (weapon: Weapon, emoji: String)
        
        // Logic for comparing player and computer weapons
        // This could be refactored into a switch
        
        let compsWeapon = compPlaysThat?.weapon
        let playersWeapon = playerPlaysThis?.weapon
        
        if compsWeapon == playersWeapon {
            self.results.text = Msg.display(text: .tie)
        } else if compsWeapon == Weapon.scissors && playersWeapon == Weapon.rock
            || compsWeapon == Weapon.paper && playersWeapon == Weapon.scissors
            || compsWeapon == Weapon.rock && playersWeapon == Weapon.paper {
            self.results.text = Msg.display(text: .win)
            wins += 1
        } else {
            self.results.text = Msg.display(text: .lose)
            losses += 1
        }
        
        if playerPlaysThis != nil {
            // This displays the player's pick
            playmoji.text = playerPlaysThis!.emoji
            print(playerPlaysThis!.emoji)
            } else {
            playmoji.text = "👋"
        }
        
        if compPlaysThat != nil {
            compoji.text = compPlaysThat!.emoji
            print(compPlaysThat!.emoji)
        } else {
            compoji.text = "👋"
        }
        
        rounds += 1
        
        currentRound.text = String(rounds)
        playerWins.text = String(wins)
        playerLosses.text = String(losses)
    }
}
