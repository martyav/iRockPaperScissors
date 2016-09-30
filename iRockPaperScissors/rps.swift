//
//  rps.swift
//  iRockPaperScissors
//
//  Created by Marty Avedon on 9/29/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import Foundation

enum Weaponry: Int {
    case rock = 0
    case paper = 1
    case scissors = 2
}

func weaponEmoji(_ weapon: Weaponry) -> String {
    switch weapon {
    case .rock:
        return "\u{270A}"
    case .paper:
        return "\u{270B}"
    case .scissors:
        return "\u{270C}"
    }
}
