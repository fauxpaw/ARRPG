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
    case Primary    // usually a weapon (sword etc)
    case Secondary  // usually a shield, but could be another sword (dual-wield) or occupied by two-handed weapon
    case Head       // helmet, hat, etc
    case Body       // body armor, robe, etc
    case Accessory  // ring, belt, etc
}
