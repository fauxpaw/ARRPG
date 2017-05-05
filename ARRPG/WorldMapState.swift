//
//  WorldMapState.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/5/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

class WorldMapState: State {
    
    let mapVC: MapViewController
    //add menus controller
    
    init(owner: MapViewController) {
        self.mapVC = owner
    }
    
    override func onEnter() {
        
    }
    
    override func onExit() {
        
    }

}
