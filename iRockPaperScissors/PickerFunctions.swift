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

func determineWinners(player1: Weapon, player2: Weapon) -> String {
    switch player1 {
    case Weapon.rock:
        switch player2 {
        case Weapon.scissors:
            return Msg.display(text: .win)
        case Weapon.paper:
            return Msg.display(text: .lose)
        default:
            return Msg.display(text: .tie)
        }
    case Weapon.paper:
        switch player2 {
            case Weapon.scissors:
            return Msg.display(text: .win)
        case Weapon.rock:
            return Msg.display(text: .lose)
        default:
            return Msg.display(text: .tie)
        }
    case Weapon.scissors:
        switch player2 {
        case Weapon.paper:
            return Msg.display(text: .win)
        case Weapon.rock:
            return Msg.display(text: .lose)
        default:
            return Msg.display(text: .tie)
        }
    }
}

