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
        DispatchQueue.main.async {
            for button in self.buttons {
                button.layer.cornerRadius = 25
                button.layer.backgroundColor = UIColor(red: 128/255, green: 64/255, blue: 0/255, alpha: 0.5).cgColor
                button.layer.borderWidth = 2
                button.layer.borderColor = UIColor(red: 128/255, green: 64/255, blue: 0/255, alpha: 0.5).cgColor
                
            }
        }
    }
    
    func hideMenu() {
        DispatchQueue.main.async {
            for button in self.buttons {
                button.isHidden = true
                button.isUserInteractionEnabled = false
            }
        }
    }
    
    func showMenu() {
        DispatchQueue.main.async {
            for button in self.buttons {
                button.isHidden = false
                button.isUserInteractionEnabled = true
            }
        }
        
    }
    
    func animateIn() {
        
    }
    
    func animateOut() {
        
    }
}
