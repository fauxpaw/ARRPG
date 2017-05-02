//
//  BattleViewController.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/1/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit
import SceneKit
import CoreLocation
import AVFoundation
//import CoreLocation

class BattleViewController: UIViewController {

    var player = Character(hp: 100, mp: 10)
    var mob : Monster?
    var cameraSession: AVCaptureSession?
    var cameraLayer: AVCaptureVideoPreviewLayer?
    //var target: ARItem?
    
    @IBOutlet weak var attackButton: UIButton!
    @IBOutlet weak var magicButton: UIButton!
    @IBOutlet weak var itemButton: UIButton!
    @IBOutlet weak var runButton: UIButton!
    @IBOutlet weak var sceneView: SCNView!
    @IBOutlet weak var enemyHPLabel: UILabel!
    @IBOutlet weak var playerHPLabel: UILabel!
    @IBOutlet weak var playerLvlLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerMPLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCamera()
        self.setupScene()
        self.setupMob()
        self.styleUI()
        self.updateUI()
    }

    
    func setupScene() {
        sceneView.scene = MainScene()
    }
    
    func setupCamera() {
        self.loadCamera()
        self.cameraSession?.startRunning()
    }
    
    func setupMob() {
        //backing model setup
        let monster = Monster(target: self.player)
        self.mob = monster
        player.target = mob
        //3d model view setup
        
        
    }
    
    func styleUI(){
        playerNameLabel.layer.borderWidth = 4
        playerNameLabel.layer.borderColor = UIColor.white.cgColor
        let labels = [playerNameLabel, playerLvlLabel, playerHPLabel, playerMPLabel]
        let buttons = [runButton, attackButton, magicButton, itemButton]
        for label in labels {
            label?.layer.backgroundColor = UIColor(red: 0/255, green: 159/255, blue: 184/255, alpha: 0.5).cgColor
        }
        
        for button in buttons {
            button?.layer.cornerRadius = 25
            button?.layer.backgroundColor = UIColor(red: 0/255, green: 159/255, blue: 184/255, alpha: 0.5).cgColor
        }
        
    }
    
    func updateUI() {
        
        if let mons = mob {
            let strokeTextAttributes = [
                NSStrokeColorAttributeName : UIColor.black,
                NSForegroundColorAttributeName : UIColor.white,
                NSStrokeWidthAttributeName : -4.0,
                NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16)
                ] as [String : Any]
            
            playerNameLabel.attributedText = NSMutableAttributedString(string: "SweetAvatarName", attributes: strokeTextAttributes)
            playerLvlLabel.attributedText = NSMutableAttributedString(string: "Lvl: \(player.Lvl)", attributes: strokeTextAttributes)
            enemyHPLabel.attributedText = NSMutableAttributedString(string: "Enemy HP: \(mons.currentHP)", attributes: strokeTextAttributes)
            playerMPLabel.attributedText = NSMutableAttributedString(string: "MP: \(player.currentMP)", attributes: strokeTextAttributes)
            playerHPLabel.attributedText = NSMutableAttributedString(string: "HP: \(player.currentHP)", attributes: strokeTextAttributes)
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
            self.player.attack()
            self.updateUI()
            monster.attack()
            self.updateUI()
            
        } else {
            print("its dead!")
        }
    }

    @IBAction func magicButtonSelected(_ sender: Any) {
        
        print("Casting magic")
        
    }
    
    
    @IBAction func itemButtonSelected(_ sender: Any) {
        
        print("Which item would you like to use?")
        
    }
    
    @IBAction func runButtonSelected(_ sender: Any) {
        
        print("Trying to run away!")
        
    }
    
}
