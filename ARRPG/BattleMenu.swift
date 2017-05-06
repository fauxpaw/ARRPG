//
//  BattleMenu.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/3/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit

class BattleMenu: UIView {
    
    var buttons = [UIButton]()
    var labels = [UILabel]()
    
    func attackState() {
        self.hideLootMenu()
        self.showAttackMenu()
    }
    
    func lootState() {
        self.hideAttackMenu()
        self.showLootMenu()
    }
    
    func styleUI(){
        for button in buttons {
            button.layer.cornerRadius = 25
            button.layer.backgroundColor = UIColor(red: 128/255, green: 64/255, blue: 0/255, alpha: 0.5).cgColor
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor(red: 128/255, green: 64/255, blue: 0/255, alpha: 0.5).cgColor
        }
    }
    
    func hideAttackMenu() {
        for button in buttons {
            if button.isKind(of: AttackMenuButton.self) {
                button.isHidden = true
                button.isUserInteractionEnabled = false
            }
        }
    }
    
    func showAttackMenu() {
        for button in buttons {
            if button.isKind(of: AttackMenuButton.self) {
                button.isHidden = false
                button.isUserInteractionEnabled = true
            }
        }
    }
    
    func hideLootMenu() {
        for button in buttons {
            if button.isKind(of: LootMenuButton.self) {
                button.isHidden = true
                button.isUserInteractionEnabled = false
            }
        }
    }
    
    func showLootMenu() {
        for button in buttons {
            if button.isKind(of: LootMenuButton.self) {
                button.isHidden = false
                button.isUserInteractionEnabled = true
            }
        }
    }
}
