//
//  rps.swift
//  iRockPaperScissors
//
//  Created by Marty Avedon on 9/29/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import Foundation

enum Weaponry: String {
    case rock = "r"
    case paper = "p"
    case scissors = "s"
}

func weaponEmoji(_ weapon: Weaponry) -> Character {
    switch weapon {
    case .rock:
        return "\u{270A}"
    case .paper:
        return "\u{270B}"
    case .scissors:
        return "\u{270C}"
    }
}
