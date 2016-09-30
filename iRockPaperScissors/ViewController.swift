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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK - Action
    
    // This is defined in reverse because it makes more sense for dark mode to be implemented by shutting the switch off
    @IBAction func darkMode(_ sender: UISwitch) {
        if darkMode.isOn != true {
            // We also need to set the background for the section & the switch -- as-is we have ugly corners
            view.backgroundColor = .black
            view.tintColor = .white
        } else {
            view.tintColor = .black
            view.backgroundColor = .white
        }
    }
    
    func compPick() -> Weaponry {
        let randomChoice = Int(arc4random_uniform(2))
        let itemComp = Weaponry(rawValue: randomChoice)
        let compEmoji = weaponEmoji(itemComp!)
        
        compoji.text = compEmoji
        compoji.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        
        return itemComp!
    }
    
    @IBAction func pickerButtons(_ sender: UISegmentedControl) {

        let playerPlaysThat = Weaponry(rawValue: pickerButton.selectedSegmentIndex)
        // cast this into a weapon and feed it to the weapon function
        let playerEmoji = weaponEmoji(playerPlaysThat!)
        
        playmoji.text = playerEmoji
        // This turns it sideways
        playmoji.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        
        let compPlaysThis = compPick()
        
        // Logic for comparing player and computer weapons
        // This could be refactored into a switch
        
        if compPlaysThis == playerPlaysThat {
            results.text = msg(.tie)
        } else if compPlaysThis == Weaponry.scissors && playerPlaysThat == Weaponry.rock
            || compPlaysThis == Weaponry.paper && playerPlaysThat == Weaponry.scissors
            || compPlaysThis == Weaponry.rock && playerPlaysThat == Weaponry.paper {
            results.text = msg(.win)
            wins += 1
        } else {
            results.text = msg(.lose)
            losses += 1
        }
        
        rounds += 1
    }
}

