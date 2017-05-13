//
//  Menu.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/13/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit

class Menu: UIView {
    
    var buttons = [UIButton]()
    
    func applyStyle() {
        
    }
    
    func hideMenu() {
        for button in buttons {
            button.isHidden = true
            button.isUserInteractionEnabled = false
        }
    }
    
    func showMenu() {
        for button in buttons {
            button.isHidden = false
            button.isUserInteractionEnabled = true
        }
    }
}
