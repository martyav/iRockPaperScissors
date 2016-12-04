//
//  customButton.swift
//  BlackJack
//
//  Created by Marty Avedon on 11/13/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.layer.cornerRadius = 5.0;
    }
}
