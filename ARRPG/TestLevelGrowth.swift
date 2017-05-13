//
//  TestLevelGrowth.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/9/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit

class TestLevelGrowth: GameViewController {
    
    let player = Character(withLvl: 1)
    @IBOutlet weak var statsView: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var levelMetrics: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player.owner = self
        self.givePlayerItems()
        StatCalculator.shared.reCalcBaseStats(entity: self.player)
        self.testExpLvlEqs()
        self.updateStats()
        
    }
    
    func testExpLvlEqs() {
       let next = ExperienceCalculator.shared.experienceNeededForNextLevel(entity: player)
        if let totalExp = ExperienceCalculator.shared.experienceForLevel(entity: player){
            levelMetrics.text = "Total exp needed for this level: \(totalExp) \nExp until next level: \(next)"
        }
        
    }
    
    func givePlayerItems() {
        let item1 = Spatha(owner: player)
        let _ = player.equipItem(item: item1, possibleSlots: item1.possibleSlots)
    }
    
    func updateStats() {
        statsView.text = "Name: \(player.name) \nLvl: \(player.lvl.getValue()) \nHP: \(player.currentHP.getValue())/\(player.maxHP.getValue()) \nMP: \(player.currentMP.getValue())/\(player.maxMP.getValue()) \nATK: \(player.atk.getValue())  \nPAT: \(player.PAT.getValue()) \nSAT: \(player.SAT.getValue()) \nCAT: \(player.CAT.getValue()) \nMAT: \(player.MAT.getValue()) \nEAT: \(player.EAT.getValue()) \nFAT: \(player.FAT.getValue()) \nAAT: \(player.AAT.getValue()) \nWAT: \(player.WAT.getValue()) \nDEF: \(player.def.getValue()) \nPDF: \(player.PDF.getValue()) \nCDF: \(player.CDF.getValue()) \nSDF: \(player.SDF.getValue()) \nMDF: \(player.MDF.getValue()) \nER: \(player.ER.getValue()) \nFR: \(player.FR.getValue()) \nAR: \(player.AR.getValue()) \nWR: \(player.WR.getValue()) \nRES: \(player.RES.getValue()) \nEVD: \(player.EVD.getValue()) \nSPD: \(player.SPD.getValue())"
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        player.lvl.setValue(to: Int(sender.value))
        StatCalculator.shared.reCalcBaseStats(entity: self.player)
        self.testExpLvlEqs()
        self.updateStats()
    }
}
