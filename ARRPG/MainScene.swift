//
//  MainScene.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/1/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit
import SceneKit


class MainScene: SCNScene {
    
    let cameraNode = SCNNode()
    let targetNode = SCNNode(geometry: SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0))
    
    override init() {
        super.init()
        self.cameraNode.camera = SCNCamera()
        self.cameraNode.position = SCNVector3(0, 0, 10)
        self.rootNode.addChildNode(cameraNode)
        self.rootNode.addChildNode(targetNode)
        targetNode.position.y += 1
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
