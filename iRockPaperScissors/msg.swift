//
//  msg.swift
//  iRockPaperScissors
//
//  Created by Marty Avedon on 9/29/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import Foundation

enum Msg {
    case hi
    case bye
    case instructions
    case shoot
    case win
    case lose
    case tie
    case error


    static func display(text: Msg) -> String {
        switch text {
        case .hi:
            return "Welcome to...ROCK PAPER SCISSORS!\nAre you ready to ROCK?"
        case .bye:
            return "Bye!!"
        case .instructions:
            return "Ok. Here goes.\nWe've got 3 different items: rock, paper, and scissors.\nRock beats scissors, paper beats rock, and scissors beats paper.\nEach round, you pick which item to play.\nBest of 3 wins (not counting ties).\nLet's play!"
        case .shoot:
            return "Rock paper scissors says shoot!\n(R)ock\n(P)aper\n(S)cissors\n"
        case .win:
            return "You win!"
        case .lose:
            return "You lose!"
        case .tie:
            return "Jinx!"
        case .error:
            return "Error!"
        }
    }
}
