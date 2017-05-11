//
//  InventoryViewController.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/7/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit
//To use:
//set character owner to this VC
//get items from characters bag
class InventoryViewController: GameViewController {
    
    @IBOutlet weak var statsView: UITextView!
    let player = Character(withLvl: 1)
    
    @IBOutlet weak var mainHand: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var offHand: UIImageView!
    @IBOutlet weak var headView: UIImageView!
    @IBOutlet weak var chestView: UIImageView!
    @IBOutlet weak var legsView: UIImageView!
    @IBOutlet weak var feetView: UIImageView!
    @IBOutlet weak var shoulderView: UIImageView!
    @IBOutlet weak var armsView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player.owner = self
        let item = BroadAxe(owner: self.player)
        let item1 = GreatAxe(owner: self.player)
        let item2 = Spatha(owner: self.player)
        let item3 = HealthPotion(owner: self.player)
        let item4 = HealthPotion(owner: self.player)
        let item5 = HealthPotion(owner: self.player)
        let item6 = HealthPotion(owner: self.player)
        let item7 = CrusaderHelm(owner: self.player)
        let item8 = KnightsCuirass(owner: self.player)
        let item9 = KiteShield(owner: self.player)
        
        let allItems = [item, item1, item2, item3, item4, item5, item6, item7, item8, item9]
        for item in allItems {
            player.addItemToBag(item: item)
        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.addGesture()
        StatCalculator.shared.reCalcStats(entity: player)
        self.updateLabels()
    }
    
    func addGesture() {
        let views = [mainHand, offHand, headView, chestView, shoulderView, legsView, feetView, armsView]
        
        
        for view in views {
            if let v = view {
                let gesture = UITapGestureRecognizer(target: self, action: #selector(InventoryViewController.handleTouch(sender:)))
                gesture.numberOfTapsRequired = 1
                v.isUserInteractionEnabled = true
                v.addGestureRecognizer(gesture)
                print("adding gesture to \(v)")

            }
        }
    }
    
    func handleTouch(sender: UITapGestureRecognizer) {
        print("Image view tapped")
        if let tappedView = sender.view as? UIImageView {
            
            for item in player.itemsEquipped {
                if item.image == tappedView.image {
                    for slot in item.currentSlotsTaken {
                        player.dequip(atSlot: slot)
                        self.tableView.reloadData()
                        self.updateLabels()
                    }
                }
            }
            tappedView.image = nil
        }
        
    }
    
    func updateLabels() {
        statsView.text = "Name: \(player.name) \nLvl: \(player.lvl.getValue()) \nHP: \(player.currentHP.getValue())/\(player.maxHP.getValue()) \nMP: \(player.currentMP.getValue())/\(player.maxMP.getValue()) \nATK: \(player.atk.getValue())  \nPAT: \(player.PAT.getValue()) \nSAT: \(player.SAT.getValue()) \nCAT: \(player.CAT.getValue()) \nMAT: \(player.MAT.getValue()) \nEAT: \(player.EAT.getValue()) \nFAT: \(player.FAT.getValue()) \nAAT: \(player.AAT.getValue()) \nWAT: \(player.WAT.getValue()) \nDEF: \(player.def.getValue()) \nPDF: \(player.PDF.getValue()) \nCDF: \(player.CDF.getValue()) \nSDF: \(player.SDF.getValue()) \nMDF: \(player.MDF.getValue()) \nER: \(player.ER.getValue()) \nFR: \(player.FR.getValue()) \nAR: \(player.AR.getValue()) \nWR: \(player.WR.getValue()) \nRES: \(player.RES.getValue()) \nEVD: \(player.EVD.getValue()) \nSPD: \(player.SPD.getValue())"
        
    }
    
    func addItemImage(image: UIImage, toSlots: [EquipmentSlots]) {
        for slot in toSlots {
            switch slot {
            case .MainHand:
                mainHand.image = image
            case .OffHand:
                offHand.image = image
            case .Head:
                headView.image = image
            case .Body:
                chestView.image = image
            case .Arms:
                armsView.image = image
            case .Feet:
                feetView.image = image
            case .Legs:
                legsView.image = image
            case .Shoulder:
                shoulderView.image = image
            default:
                print("not exhaustive case yet")
            }
        }
    }
    
    func removeItemImage(fromSlot: [EquipmentSlots]) {
        for slot in fromSlot{
            switch slot {
            case .MainHand:
                mainHand.image = nil
                mainHand.alpha = 1.0
                print("removing image from main")
            case .OffHand:
                offHand.image = nil
                offHand.alpha = 1.0
                print("removing image from off")
            case .Head:
                headView.alpha = 1.0
                headView.image = nil
            case .Body:
                chestView.image = nil
                chestView.alpha = 1.0
            case .Arms:
                armsView.image = nil
                armsView.alpha = 1.0
            case .Feet:
                feetView.alpha = 1.0
                feetView.image = nil
            case .Legs:
                legsView.alpha = 1.0
                legsView.image = nil
            case .Shoulder:
                shoulderView.alpha = 1.0
                shoulderView.image = nil
            default:
                print("not exhaustive case handling")
            }
        }
    }
}

extension InventoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = player.bag.contents[indexPath.row]
        if item.isKind(of: Equipable.self) {
            if let equip = item as? Equipable {
                let destination = player.equipItem(item: equip, possibleSlots: equip.possibleSlots)
                addItemImage(image: equip.image, toSlots: destination)
                
            }
        }
        
        else if item.isKind(of: Consumable.self) {
            if let consume = player.bag.contents[indexPath.row] as? Consumable {
                consume.consumeItem()
            }
        }
        
        self.updateLabels()
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            ?? UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = player.bag.contents[indexPath.row].name
        cell.detailTextLabel?.text = player.bag.contents[indexPath.row].desc
        cell.imageView?.image = player.bag.contents[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return player.bag.contents.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Bag Contents"
    }
    
}

