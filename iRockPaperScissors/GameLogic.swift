//
//  GameLogic.swift
//  iRockPaperScissors
//
//  Created by Marty Avedon on 12/3/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import Foundation

func chosenByPlayer(_ num: Int) -> (weapon: Weapon, emoji: String) {
    let playersChoice = Weapon.convertInt(toWeapon: num)
    let playersPickEmoji = Weapon.convertWeapon(toEmoji: playersChoice)
    
    return (playersChoice, playersPickEmoji)
}

func chooseForComputer() -> (weapon: Weapon, emoji: String) {
    let randomChoice = Int(arc4random_uniform(2))
    let computersPick = Weapon.convertInt(toWeapon: randomChoice)
    let computersPickEmoji = Weapon.convertWeapon(toEmoji: computersPick)
    
    return (computersPick, computersPickEmoji)
}

func trackWinsLosses() {}
