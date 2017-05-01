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

    var player = Character(hp: 100, mp: 10)
    var mob : Monster?
    var cameraSession: AVCaptureSession?
    var cameraLayer: AVCaptureVideoPreviewLayer?
    //var target: ARItem?
    let scene = SCNScene()
    let cameraNode = SCNNode()
    let targetNode = SCNNode(geometry: SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0))

    @IBOutlet weak var sceneView: SCNView!
    
    @IBOutlet weak var enemyHPLabel: UILabel!
    
    @IBOutlet weak var playerHPLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadCamera()
        self.cameraSession?.startRunning()
        sceneView.scene = scene
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 10)
        scene.rootNode.addChildNode(cameraNode)
        //targetNode.name = "Enemy"
        //self.target?.itemNode = targetNode
        //scene.rootNode.addChildNode((target?.itemNode)!)
        scene.rootNode.addChildNode(targetNode)
        targetNode.position.y += 1
        self.setupMob()
        self.updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    
    }
    
    func setupMob() {
        //let mob = Monster(target: self.player)
        let monster = Monster(target: self.player)
        self.mob = monster
        player.target = mob
    }
    
    func updateUI() {
        
        if let mons = mob {
            let strokeTextAttributes = [
                NSStrokeColorAttributeName : UIColor.black,
                NSForegroundColorAttributeName : UIColor.white,
                NSStrokeWidthAttributeName : -4.0,
                NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16)
                ] as [String : Any]
            
            enemyHPLabel.attributedText = NSMutableAttributedString(string: "Enemy HP: \(mons.currentHP)", attributes: strokeTextAttributes)
            playerHPLabel.attributedText = NSMutableAttributedString(string: "Player HP: \(player.currentHP)", attributes: strokeTextAttributes)
        }
    }
    
    func createCaptureSession() -> (session: AVCaptureSession?, error: NSError?) {
        
        var error: NSError?
        var captureSession: AVCaptureSession?
        
        let backVideoDevice = AVCaptureDevice.defaultDevice(withDeviceType: .builtInWideAngleCamera, mediaType: AVMediaTypeVideo, position: .back)
        
        if backVideoDevice != nil {
            var videoInput : AVCaptureDeviceInput!
            do {
                videoInput = try AVCaptureDeviceInput(device: backVideoDevice)
            } catch let error1 as NSError {
                error = error1
                videoInput = nil
            }
            
            if error == nil {
                captureSession = AVCaptureSession()
                
                if captureSession!.canAddInput(videoInput) {
                    captureSession?.addInput(videoInput)
                } else {
                    error = NSError(domain: "", code: 0, userInfo: ["description": "Error adding video input"])
                }
            } else {
                error = NSError(domain: "", code: 1, userInfo: ["description": "Error creating capture device input"])
            }
            
        } else {
            error = NSError(domain: "", code: 2, userInfo: ["description":"back video device not found"])
        }
        
        return (session: captureSession, error: error)
        
    }
    
    func loadCamera() {
        let captureSessionResult = self.createCaptureSession()
        
        guard captureSessionResult.error == nil, let session = captureSessionResult.session else {
            print("error creating capture session")
            return
        }
        
        self.cameraSession = session
        
        if let cameraLayer = AVCaptureVideoPreviewLayer(session: self.cameraSession) {
            cameraLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            cameraLayer.frame = self.view.bounds
            self.view.layer.insertSublayer(cameraLayer, at: 0)
            self.cameraLayer = cameraLayer
        }
    }
 
    @IBAction func attackButtonPressed(_ sender: Any) {
        
        //add roll to see who attacks first?
        guard let monster = mob else { return }
        if monster.currentHP > 0 {
            player.attack()
            self.updateUI()
            self.mob?.attack()
            self.updateUI()
        } else {
            print("its dead!")
        }
    }
}
