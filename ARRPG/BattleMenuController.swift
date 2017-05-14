//
//  MenuController.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/13/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class BattleMenuController {
    
    let battleMenu = BattleMenu()
    let lootMenu = LootMenu()
    let koMenu = KOMenu()
    var menus = [Menu]()
    
    func setup() {
        menus = [battleMenu, lootMenu, koMenu]
        self.battleMenu.applyStyle()
        self.lootMenu.applyStyle()
    }
    
    func hideAll() {
        for element in menus {
            element.hideMenu()
        }
    }
    
    func attackState() {
        self.hideAll()
        self.battleMenu.showMenu()
    }
    
    func lootState() {
        self.hideAll()
        self.lootMenu.showMenu()
    }
    
    func koState() {
        self.hideAll()
        self.koMenu.showMenu()
    }
}
