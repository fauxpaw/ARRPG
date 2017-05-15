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

    var pass = true
    var player = Character(withLvl: 1)
    var mob : Monster?
    let menuController = BattleMenuController()
    let arController = ARController()
    var nextMobAction = TimeInterval(2) //TODO: Derive from mobs SPD...
    
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
    @IBOutlet weak var reviveButton: UIButton!
    
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
        let staby = Spatha(owner: player)
        player.equipItem(item: staby, possibleSlots: staby.possibleSlots)
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
        self.playerLvlLabel.text = "Lvl: \(player.LVL.getValue())"
        self.playerHPLabel.text = "HP: \(self.player.currentHP.getValue())/\(self.player.maxHP.getValue())"
        self.playerMPLabel.text = "MP: \(self.player.currentMP.getValue())/\(self.player.maxMP.getValue())"
        guard let mob = mob else {return}
        self.enemyHPLabel.text = "Enemy HP: \(mob.currentHP.getValue())"
    }
    
    func enableAttackButton() {
        DispatchQueue.main.async {
            self.attackButton.isEnabled = true
        }
    }
    
    func enableRunButton() {
        DispatchQueue.main.async {
            self.runButton.isEnabled = true
        }
    }
    
    @IBAction func attackButtonPressed(_ sender: Any) {
        //button cooldown
        self.attackButton.isEnabled = false
        self.attackButton.isHighlighted = true
        let next = AttackRateCalculator.shared.getNextAttack(entity: player)
        Timer.scheduledTimer(timeInterval: next, target: self, selector: #selector(self.enableAttackButton), userInfo: nil, repeats: false)
        
        //check for hit & apply dmg
        let hit = HitRateCalculator.shared.willAttackHit(attacker: player, defender: player.target!)
        if hit {
            let dmg = DamageHandler.shared.calculateBaseDMG(attacker: player, defender: player.target!)
            let hpResult = player.target!.takeDmg(amount: dmg)
            self.updateStats()
            if hpResult < 1 {
                self.changeState(toState: LootBattleState(owner: self))
            }
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
        
        DispatchQueue.main.async {
            self.runButton.isEnabled = false
            self.runButton.isHighlighted = true
        }
        //waits 5 seconds between run attempts
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.enableRunButton), userInfo: nil, repeats: false)
        
        print("Trying to run away!")
        guard let mob = mob else {return}
        let check = EscapeHandler.shared.willEscape(player: player, monster: mob)
        if check {
            performSegue(withIdentifier: "endBattle", sender: self)
            return
        }
        print("could not escape!")
        
    }
    
    @IBAction func lootButtonSelected(_ sender: Any) {
        
        performSegue(withIdentifier: "endBattle", sender: self)
        
    }
    
    @IBAction func reviveButtonSelected(_ sender: KOMenuButton) {
        print("do some revivey stuff...")
        self.changeState(toState: NullState())
        performSegue(withIdentifier: "endBattle", sender: self)
    }
}

extension BattleViewController: SCNSceneRendererDelegate {
    //Game loop logic
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        
        //TODO: replace with good implemetation - create time as system time interval for self property and delete the following
        if pass{
            pass = false
            guard let mob = self.mob else {return}
            nextMobAction = time + AttackRateCalculator.shared.getNextAttack(entity: mob)
            return
        }
        
        //monster action on interval timer
        if self.currentState is CombatBattleState {
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
                
                self.nextMobAction = time + AttackRateCalculator.shared.getNextAttack(entity: mob)
                DispatchQueue.main.async {
                    self.updateStats()
                }
            }
        }
    }
}
