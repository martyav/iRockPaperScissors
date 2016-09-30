//
//  ViewController.swift
//  iRockPaperScissors
//
//  Created by Marty Avedon on 9/29/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var darkMode: UISwitch!
    
    var rounds = 0
    var wins = 0
    var losses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // These need to load up here b/c if they're up top the compiler complains
        
        var itemPlayer: Weaponry
        var itemComp: Weaponry
    }
    
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

}

