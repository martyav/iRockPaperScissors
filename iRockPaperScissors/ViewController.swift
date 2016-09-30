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
    
    var rounds = 0
    var wins = 0
    var losses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // These need to load up here b/c if they're up top the compiler complains
        
    }
    
    // MARK - Action
    
    // This is defined in reverse because it makes more sense for dark mode to be implemented by shutting the switch off
    @IBAction func darkMode(_ sender: UISwitch) {
        if darkMode.isOn != true {
            // We also need to set the backfound for the section & the switch
            view.backgroundColor = .black
            view.tintColor = .white
        } else {
            view.tintColor = .black
            view.backgroundColor = .white
        }
    }
    
    @IBAction func pickerButtons(_ sender: UISegmentedControl) {

        var itemPlayer = Weaponry(rawValue: pickerButton.selectedSegmentIndex)
        // cast this into a weapon and feed it to the weapon function
        let playerEmoji = weaponEmoji(itemPlayer!)
        
        playmoji.text = playerEmoji
        // This turns it sideways
        playmoji.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        rounds += 1
    }

}

