//
//  Feature.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/6/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation


class Feature: NSObject, FeatureBehavior {
    
    private(set) var target : Entity?
    
    func activate(target: Entity) {
        if self.target == nil {
           self.target = target
            self.onApply()
        }
    }
    
    func deactivate(target: Entity) {
        if self.target == nil {
            self.target = target
        }
        self.onRemove()
        self.target = nil
    }
    
    func apply(target : Entity) {
        self.target = target
        self.onApply()
        self.target = nil

    }
    
    func onRemove() {}
    func onApply() {}
    
}
