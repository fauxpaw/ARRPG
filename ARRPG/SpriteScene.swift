//
//  SpriteScene.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/2/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import Foundation
import SpriteKit

class SpriteScene: SKScene {
    
    //
    //  PauseScene.swift
    //  CombinedSpriteKitSceneKit
    //
    //  Created by Davis Allie on 21/05/2015.
    //  Copyright (c) 2015 tutsplus. All rights reserved.
    //
        var pauseNode: SKSpriteNode!
        var scoreNode: SKLabelNode!
        
        var score = 0 {
            didSet {
                self.scoreNode.text = "Score: \(self.score)"
            }
        }
        
        override init(size: CGSize) {
            super.init(size: size)
            
            self.backgroundColor = UIColor.clear
            
            let spriteSize = size.width/12
            self.pauseNode = SKSpriteNode(imageNamed: "gemBlue")
            self.pauseNode.size = CGSize(width: spriteSize, height: spriteSize)
            self.pauseNode.position = CGPoint(x: spriteSize + 8, y: spriteSize + 8)
            
            self.scoreNode = SKLabelNode(text: "Some text")
            self.scoreNode.fontName = "DINAlternate-Bold"
            self.scoreNode.fontColor = UIColor.black
            self.scoreNode.fontSize = 24
            self.scoreNode.position = CGPoint(x: size.width/2, y: self.pauseNode.position.y - 9)
            
            self.addChild(self.pauseNode)
            self.addChild(self.scoreNode)
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
    

    
    
}
