//
//  BattleViewController.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/1/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit
import SceneKit
import AVFoundation
//import CoreLocation

class BattleViewController: UIViewController {

    let player = Character(hp: 100, mp: 10)

    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    
    }
 
    @IBAction func attackButtonPressed(_ sender: Any) {
        
         player.attack()
    }

}
