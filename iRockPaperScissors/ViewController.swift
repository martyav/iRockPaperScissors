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
    @IBOutlet weak var trollMode: UISwitch!
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
    
    var trolling = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // increase font size on picker
        let font = UIFont.systemFont(ofSize: 30)
        pickerButton.setTitleTextAttributes([NSFontAttributeName: font], for: .normal)
        
        // turn emojis sideways/reversed
        playmoji.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        compoji.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
    }
    
    // MARK: - Actions
    
    @IBAction func pickerButtons(_ sender: UISegmentedControl) {
        playerPlaysThis = chosenByPlayer(pickerButton.selectedSegmentIndex) as (weapon: Weapon, emoji: String)
        let playersWeapon = playerPlaysThis?.weapon
        var compsWeapon: Weapon?
        
        // Basic mode
        
        if trolling == false {
            compPlaysThat = chooseForComputer() as (weapon: Weapon, emoji: String)
            compsWeapon = compPlaysThat?.weapon
        }
            
        // Troll mode
        
        else {
            let randomlyFrustrate = Int(arc4random_uniform(10))
            
            switch randomlyFrustrate {
                
            // 70% of the time, make the player lose
            case 6, 5, 4, 3, 2, 1, 0:
                switch playersWeapon! as Weapon {
                case Weapon.rock:
                    compPlaysThat = (weapon: Weapon.paper, emoji: Weapon.convertWeapon(toEmoji: Weapon.paper))
                    compsWeapon = compPlaysThat?.weapon
                case Weapon.paper:
                    compPlaysThat = (weapon: Weapon.scissors, emoji: Weapon.convertWeapon(toEmoji: Weapon.scissors))
                case Weapon.scissors:
                    compPlaysThat = (weapon: Weapon.rock, emoji: Weapon.convertWeapon(toEmoji: Weapon.rock))
                }
                
            // 20% of the time, make the player tie
            case 8, 7:
                compPlaysThat = playerPlaysThis! as (weapon: Weapon, emoji: String)
                compsWeapon = compPlaysThat?.weapon
                
            // 10% of the time, or whenever something weird happens, give the player a chance of winning. Actual chance is 30% of 10%, or 3%
            default:
                compPlaysThat = chooseForComputer() as (weapon: Weapon, emoji: String)
                compsWeapon = compPlaysThat?.weapon
            }
        }
        
        // Determining winners & display stuff
        
        self.results.text = determineWinners(player: playersWeapon!, comp: compsWeapon!)
        
        if playerPlaysThis != nil {
            // This displays the player's pick
            playmoji.text = playerPlaysThis!.emoji
            print("Player: " + playerPlaysThis!.emoji)
        } else {
            playmoji.text = "👋"
        }
        
        if compPlaysThat != nil {
            compoji.text = compPlaysThat!.emoji
            print("CPU: " + compPlaysThat!.emoji)
        } else {
            compoji.text = "👋"
        }
        
        rounds += 1
        if results.text == Msg.display(text: .win) {
            wins += 1
        } else if results.text == Msg.display(text: .lose) {
            losses += 1
        }
        
        currentRound.text = String(rounds)
        playerWins.text = String(wins)
        playerLosses.text = String(losses)
    }
    
    @IBAction func reset(_ sender: UIButton) {
        rounds = 0
        wins = 0
        losses = 0
        
        currentRound.text = String(rounds)
        playerWins.text = String(wins)
        playerLosses.text = String(losses)
        results.text = ""
        playmoji.text = "👋"
        compoji.text = "👋"
    }
    
    @IBAction func trollMode(_ sender: UISwitch) {
            trollMode.setOn(!trolling, animated: true)
            trolling = !trolling
            print(trolling)
    }
}
