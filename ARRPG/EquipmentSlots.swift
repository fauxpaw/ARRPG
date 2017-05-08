//
//  EquipmentSlots.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/7/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation


enum EquipmentSlots {
    case None
    case MainHand    // usually a weapon
    case OffHand  // usually a shield, but could be another sword (dual-wield) or occupied by two-handed weapon
    case Head       // helmet, hat, etc
    case Body       // body armor, robe, etc
    case Arms
    case Hands
    case Legs
    case Feet
    
    
    case Accessory  // ring, belt, etc
}
