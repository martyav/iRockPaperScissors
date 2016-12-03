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
    @IBOutlet weak var darkMode: UISwitch!
    @IBOutlet weak var playmoji: UILabel!
    @IBOutlet weak var compoji: UILabel!
    @IBOutlet weak var results: UILabel!
    
    var rounds = 0
    var wins = 0
    var losses = 0
    
    var playerPlaysThis: (weapon: Weapon, emoji: String)?
    var compPlaysThat: (weapon: Weapon, emoji: String)?

    override func viewDidLoad() {
        super.viewDidLoad()
        if playerPlaysThis != nil {
        // This displays the player's pick
            playmoji.text = playerPlaysThis?.emoji
            print(playerPlaysThis?.emoji)
        // This turns it sideways
            playmoji.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        } else {
            playmoji.text = ""
        }
        
        compoji.text = compPlaysThat?.emoji
        print(compPlaysThat?.emoji)
        compoji.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
    }
    
    // MARK: - Actions
    
    @IBAction func darkMode(_ sender: UISwitch) {
        // This is defined in reverse because it makes more sense for dark mode to be implemented by shutting the switch off
        if darkMode.isOn != true {
            // We also need to set the background for the section & the switch -- as-is we have ugly corners
            view.backgroundColor = .black
            results.textColor = .white
            view.tintColor = .white
        } else {
            view.tintColor = .black
            results.textColor = .black
            view.backgroundColor = .white
        }
    }
    
    @IBAction func pickerButtons(_ sender: UISegmentedControl) {
        playerPlaysThis = chosenByPlayer(pickerButton.selectedSegmentIndex) as (weapon: Weapon, emoji: String)
        compPlaysThat = chooseForComputer() as (weapon: Weapon, emoji: String)
        
        // Logic for comparing player and computer weapons
        // This could be refactored into a switch
        
        let compsWeapon = compPlaysThat?.weapon
        let playersWeapon = playerPlaysThis?.weapon
        
        if compsWeapon == playersWeapon {
            results.text = Msg.display(text: .tie)
        } else if compsWeapon == Weapon.scissors && playersWeapon == Weapon.rock
            || compsWeapon == Weapon.paper && playersWeapon == Weapon.scissors
            || compsWeapon == Weapon.rock && playersWeapon == Weapon.paper {
            results.text = Msg.display(text: .win)
            wins += 1
        } else {
            results.text = Msg.display(text: .lose)
            losses += 1
        }
        
        rounds += 1
    }
}
