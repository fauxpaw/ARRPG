//
//  JobBehavior.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/1/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation

protocol JobBehavior {
    
}

extension JobBehavior {
    func changeJob(to newJob: Job) {
        print("You changed your job to \(newJob)!")
    }
    
    func calculateStats() {
        
    }
}
