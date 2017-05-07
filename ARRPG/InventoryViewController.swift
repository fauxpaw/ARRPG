//
//  InventoryViewController.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/7/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController {
    
    let player = Character(hp: 100, mp: 20)
    
    var itemsEquiped = [Equipable]() {
        didSet {
            player.equipItem(item: itemsEquiped.last!)
            self.updateLabels()
        }
        willSet {
            if itemsEquiped.count > 0 {
                player.dequipItem(item: itemsEquiped.last!)
                self.updateLabels()
            }
        }
    }
    var itemsInBag = [Equipable]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var mainHand: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var mpLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let item = TestItem(owner: self.player)
        itemsInBag.append(item)
        let item1 = BestItem(owner: self.player)
        itemsInBag.append(item1)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.updateLabels()
    }
    
    func updateLabels() {
        hpLabel.text = "HP: \(player.currentHP.getValue())/\(player.maxHP.getValue())"
        mpLabel.text = "MP: \(player.currentMP.getValue())/\(player.maxMP.getValue())"
    }
    
}

extension InventoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        mainHand.image = cell?.imageView?.image
        let equip = itemsInBag.remove(at: indexPath.row)
        itemsEquiped.append(equip)
        player.equipItem(item: equip)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            ?? UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = itemsInBag[indexPath.row].name
        cell.detailTextLabel?.text = itemsInBag[indexPath.row].desc
        cell.imageView?.image = itemsInBag[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsInBag.count
    }
    
}
