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

    var player = Character(withLvl: 2)
    var mob : Monster?
    let menuController = BattleMenuController()
    let arController = ARController()
    var nextMobAction: TimeInterval = 2
    
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
        self.menuController.setup()
        self.sceneView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.sceneView.setup()
        self.spriteScene = SpriteScene(size: self.view.bounds.size)
        self.sceneView.overlaySKScene = self.spriteScene
        self.changeState(toState: InitialBattleState(owner: self))
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
        self.menuController.setup()
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
        print("update says HP: \(self.player.currentHP.getValue())")
        
        self.playerLvlLabel.text = "Lvl: \(player.lvl.getValue())"
        self.playerHPLabel.text = "HP: \(self.player.currentHP.getValue())/\(self.player.maxHP.getValue())"
        self.playerMPLabel.text = "MP: \(self.player.currentMP.getValue())/\(self.player.maxMP.getValue())"
        guard let mob = mob else {return}
        self.enemyHPLabel.text = "Enemy HP: \(mob.currentHP.getValue())"
    }
    
    func enableAttackButton() {
        self.attackButton.isEnabled = true
    }
    
    @IBAction func attackButtonPressed(_ sender: Any) {
        //button cooldown
        self.attackButton.isEnabled = false
        self.attackButton.isHighlighted = true
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.enableAttackButton), userInfo: nil, repeats: false)
        
        let dmg = DamageHandler.shared.calculateBaseDMG(attacker: player, defender: player.target!)
        let hpResult = player.target!.takeDmg(amount: dmg)
        self.updateStats()
        if hpResult < 1 {
            self.changeState(toState: LootBattleState(owner: self))
        }
        
    }
    
    @IBAction func magicButtonSelected(_ sender: Any) {
        
        print("Casting magic")
        let heal = DamageHandler.shared.heal(caster: player, target: player.target!)
        _ = player.target?.takeDmg(amount: -heal)
        self.updateStats()
    }
    
    @IBAction func itemButtonSelected(_ sender: Any) {
        
        print("Item button pressed!")
       
    }
    
    @IBAction func runButtonSelected(_ sender: Any) {
        
        print("Trying to run away!")
        performSegue(withIdentifier: "endBattle", sender: self)
        
    }
    
    @IBAction func lootButtonSelected(_ sender: Any) {
        
        performSegue(withIdentifier: "endBattle", sender: self)
        
    }
    
}

extension BattleViewController: SCNSceneRendererDelegate {
    //Game loop logic
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        //monster action on interval
        if time > self.nextMobAction {
            guard let mob = self.mob else {return}
            let dmg = DamageHandler.shared.calculateBaseDMG(attacker: mob, defender: (mob.target))
            let hpResult = mob.target.takeDmg(amount: dmg)
            print("HP: \(self.player.currentHP.getValue()) / \(self.player.maxHP.getValue())")
            print("mob target hp: \(self.mob?.target.currentHP.getValue()) / \(self.mob?.target.maxHP.getValue()))")
            
            if hpResult < 1 {
                let KO = KOBattleState(owner: self)
                self.changeState(toState: KO)
            }
            self.nextMobAction = time + TimeInterval(2)
            DispatchQueue.main.async {
                self.updateStats()
                
            }
        }
    }
}
