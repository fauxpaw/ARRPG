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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func fightButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toBattle", sender: sender)
    
    }
    
    

}

