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

class BattleViewController: GameViewController, arrowsUIProtocol {

    var player = Character(hp: 100, mp: 10)
    var mob : Monster?
    var cameraSession: AVCaptureSession?
    var cameraLayer: AVCaptureVideoPreviewLayer?
    let menuController = BattleMenu()
    //players, monsters
    //menu controller
    //state machine
    
    
    @IBOutlet weak var rightArrow: UIButton!
    @IBOutlet weak var leftArrow: UIButton!
    @IBOutlet weak var attackButton: AttackMenuButton!
    @IBOutlet weak var magicButton: AttackMenuButton!
    @IBOutlet weak var itemButton: AttackMenuButton!
    @IBOutlet weak var runButton: AttackMenuButton!
    @IBOutlet weak var sceneView: MainScene!
    @IBOutlet weak var lootButton: LootMenuButton!
    @IBOutlet weak var enemyHPLabel: UILabel!
    @IBOutlet weak var playerHPLabel: UILabel!
    @IBOutlet weak var playerLvlLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerMPLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupCamera()
        self.setupScene()
        self.updateStats()
        self.styleLabels()
        self.setupMenu()
        self.menuController.styleUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.sceneView.setup()
        self.setupMob()
        self.menuController.attackState()
        self.changeState(toState: InitialBattleState())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.sceneView.tearDown()
    }
    
    func setupScene() {
        sceneView.arrowsDelegate = self
        self.hideRightArrow()
        self.hideLeftArrow()
    }
    
    func setupMenu() {
        attackButton.setImage(UIImage(named: "sword")?.withRenderingMode(.alwaysOriginal), for: .normal)
        magicButton.setImage(UIImage(named: "tome")?.withRenderingMode(.alwaysOriginal), for: .normal)
        itemButton.setImage(UIImage(named: "scroll")?.withRenderingMode(.alwaysOriginal), for: .normal)
        runButton.setImage(UIImage(named: "x")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        menuController.buttons.append(attackButton)
        menuController.buttons.append(magicButton)
        menuController.buttons.append(itemButton)
        menuController.buttons.append(runButton)
        menuController.buttons.append(lootButton)
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
    
    func styleLabels(){
        
        playerNameLabel.layer.borderWidth = 4
        playerNameLabel.layer.borderColor = UIColor(red: 255/255, green: 128/255, blue: 0/255, alpha: 0.5).cgColor
        let labels = [playerNameLabel, playerLvlLabel, playerHPLabel, playerMPLabel]
        for label in labels {
            label?.layer.backgroundColor = UIColor(red: 128/255, green: 64/255, blue: 0/255, alpha: 0.5).cgColor
        }
        self.menuController.styleUI()
    }
    
    func deathChecks() {
        guard let monster = mob else {return}
        if monster.currentHP <= 0 {
            player.target = nil
            self.sceneView.removeMonster()
            self.enterLootState()
        }
        
        if player.currentHP <= 0 {
            player.expire()
            performSegue(withIdentifier: "death", sender: self)
        }
    }
    
    func enterLootState() {
        menuController.lootState()
    }
    
    func collectAllItems(){
        let item = "Great Sword"
        player.collectItem(itemToCollect: item)
    }
    
    func hideLeftArrow() {
        self.leftArrow.isHidden = true
    }
    
    func hideRightArrow() {
        self.rightArrow.isHidden = true
    }
    
    func showLeftArrow() {
        self.leftArrow.isHidden = false
    }
    
    func showRightArrow() {
        self.rightArrow.isHidden = false
    }
    
    func updateStats() {
        playerLvlLabel.text = "Lvl: \(player.Lvl)"
        playerHPLabel.text = "HP: \(player.currentHP)"
        playerMPLabel.text = "MP: \(player.currentMP)"
        guard let mob = mob else {return}
        enemyHPLabel.text = "Enemy HP: \(mob.currentHP)"
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
            self.deathChecks()
            self.updateStats()
            monster.attack()
            self.deathChecks()
            self.updateStats()
            
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
        performSegue(withIdentifier: "endBattle", sender: self)
        
    }
        
    @IBAction func lootButtonSelected(_ sender: Any) {
        
        self.collectAllItems()
        performSegue(withIdentifier: "endBattle", sender: self)
    }
    
}
