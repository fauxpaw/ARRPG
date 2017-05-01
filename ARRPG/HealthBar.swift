//
//  HealthBar.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/1/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation
import SpriteKit

//TODO: Implement with a scenekit overlay

class HealthBar: SKSpriteNode  {
    
    var delegate: BattleViewController?
    let barSize = CGSize(width: 40, height: 4)
    let fillColor = UIColor.red
    let borderColor = UIColor(red: 35.0/255, green: 28.0/255, blue: 40.0/255, alpha:1)
    
    func updateHealthBar() {
        
        //create drawing context
        UIGraphicsBeginImageContextWithOptions(barSize, false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        //draw outline for bar
        borderColor.setStroke()
        let borderRect = CGRect(origin: CGPoint(x: 0,y :0), size: barSize)
        context!.stroke(borderRect, width: 1)
        
        //draw bar with colored rectangle
        fillColor.setFill()
        let barWidth = (barSize.width - 1) * CGFloat((delegate?.mob?.currentHP)!) / CGFloat((delegate?.mob?.maxHP)!)
        let barRect = CGRect(x: 0.5, y: 0.5, width: barWidth, height: barSize.height - 1)
        context!.fill(barRect)
        
        //extract image 
        let spriteImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //set sprite texture and size
        self.texture = SKTexture(image: spriteImage!)
        self.size = barSize
    }
}
