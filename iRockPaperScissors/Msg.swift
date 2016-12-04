//
//  msg.swift
//  iRockPaperScissors
//
//  Created by Marty Avedon on 9/29/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import Foundation

enum Msg {
    case win
    case lose
    case tie
    case troll

    static func display(text: Msg) -> String {
        switch text {
        case .win:
            return "You win!"
        case .lose:
            return "You lose!"
        case .tie:
            return "Jinx!"
        case .troll:
            let randomTroll = Int(arc4random_uniform(5))
            switch randomTroll {
            case 1:
                return "You suck!"
            case 2:
                return "Haha, loser!"
            case 3:
                return "You lose!"
            default:
                return "🖕"
            }
        }
    }
}
