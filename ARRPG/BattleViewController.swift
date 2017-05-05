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
    let menuController = BattleMenu()
    let arController = ARController()
    
    //players, monsters
    //menu controller
    //state machine
    
    var spriteScene: SpriteScene!
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
        self.setupScene()
        self.updateStats()
        self.styleLabels()
        self.menuController.styleUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.sceneView.setup()
        self.spriteScene = SpriteScene(size: self.view.bounds.size)
        self.sceneView.overlaySKScene = self.spriteScene
        self.changeState(toState: InitialBattleState(owner: self))
        
        //the below method should be called after event happens (like all assets loaded)
        //possibly called from a previous state onExit?
        self.changeState(toState: CombatBattleState(owner: self))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.sceneView.tearDown()
        self.changeState(toState: NullState())
    }
    
    func setupScene() {
        sceneView.arrowsDelegate = self
        self.hideRightArrow()
        self.hideLeftArrow()
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
    
    func enableAttackButton() {
        self.attackButton.isEnabled = true
    }
    
    @IBAction func attackButtonPressed(_ sender: Any) {
        //button cooldown
        self.attackButton.isEnabled = false
        self.attackButton.isHighlighted = true
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.enableAttackButton), userInfo: nil, repeats: false)
        
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
        
        performSegue(withIdentifier: "endBattle", sender: self)
    }
    
}
