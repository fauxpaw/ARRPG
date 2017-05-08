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
    
    let player = Character(hp: 100, mp: 20)
    
    @IBOutlet weak var mainHand: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var mpLabel: UILabel!
    @IBOutlet weak var offHand: UIImageView!

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

        player.currentHP.modifyBy(val: -40)
        player.bag.append(item)
        player.bag.append(item1)
        player.bag.append(item2)
        player.bag.append(item3)
        player.bag.append(item4)
        player.bag.append(item5)
        player.bag.append(item6)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.updateLabels()
    }
    
    func updateLabels() {
        hpLabel.text = "HP: \(player.currentHP.getValue())/\(player.maxHP.getValue())"
        mpLabel.text = "MP: \(player.currentMP.getValue())/\(player.maxMP.getValue())"
    }
    
    func addItemImage(image: UIImage, toSlots: [EquipmentSlots]) {
        for slot in toSlots {
            switch slot {
            case .MainHand:
                mainHand.image = image
            case .OffHand:
                offHand.image = image
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
                print("removing image from main")
            case .OffHand:
                offHand.image = nil
                print("removing image from off")
            default:
                print("not exhaustive case handling")
            }
        }
    }
}

extension InventoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRow(at: indexPath)
        
        let itemz = player.bag[indexPath.row]
        if itemz.isKind(of: Equipable.self) {
            if let equip = itemz as? Equipable {
                let destination = player.equipItem(item: equip, possibleSlots: equip.possibleSlots)
                addItemImage(image: equip.image, toSlots: destination)
            }
        }
        
        else if itemz.isKind(of: Consumable.self) {
            if let consume = player.bag[indexPath.row] as? Consumable {
                consume.consumeItem()
            }
        }
        
        /*if let item = player.bag[indexPath.row] as? Equipable {
            let destination = player.equipItem(item: item, possibleSlots: item.possibleSlots)
            addItemImage(image: item.image, toSlots: destination)
        }*/
        
        self.updateLabels()
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            ?? UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = player.bag[indexPath.row].name
        cell.detailTextLabel?.text = player.bag[indexPath.row].desc
        cell.imageView?.image = player.bag[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return player.bag.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Bag Contents"
    }
    
}
