//
//  ViewController.swift
//  ARRPG
//
//  Created by Michael Sweeney on 4/30/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func fightButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toBattle", sender: sender)
    
    }
    
    @IBAction func mapButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toMap", sender: sender)
        
    }
    
    
}

