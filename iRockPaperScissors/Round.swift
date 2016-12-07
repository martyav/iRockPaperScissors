//
//  Round.swift
//  iRockPaperScissors
//
//  Created by Marty Avedon on 12/7/16.
//  Copyright © 2016 Marty Hernandez Avedon. All rights reserved.
//

import Foundation

// to-do: use this info inside a new table view controller that presents previous rounds and can be organized multiple ways 

struct Round {
    let winningPlayer: [String: Weapon]
    let losingPlayer: [String: Weapon]
    let elasped: Int
    let wins: Int
    let losses: Int
    let ties: Int
}
