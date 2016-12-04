//
//  rps.swift
//  iRockPaperScissors
//
//  Created by Marty Avedon on 9/29/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import Foundation

enum Weapon: Int {
    case rock
    case paper
    case scissors
    
    static func convertInt(toWeapon: Int) -> Weapon {
        return Weapon(rawValue: toWeapon)!
    }

    static func convertWeapon(toEmoji: Weapon) -> String {
        switch toEmoji {
        case .rock:
            return "\u{270A}"
        case .paper:
            return "\u{270B}"
        case .scissors:
            return "\u{270C}"
        }
    }
}
