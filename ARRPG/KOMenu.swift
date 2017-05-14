//
//  KOMenu.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/13/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit

class KOMenu: Menu {
    
    override func animateIn() {
        print("super cool animation ")
    }
    
    override func animateOut() {
        print("super cool outro")
    }
    
    override func applyStyle() {
        for button in self.buttons {
            button.layer.cornerRadius = 10
            button.layer.backgroundColor = UIColor(red: 128/255, green: 64/255, blue: 0/255, alpha: 0.5).cgColor
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor(red: 128/255, green: 64/255, blue: 0/255, alpha: 0.5).cgColor
            //button.tintColor =
            
        }
    }
    
}
