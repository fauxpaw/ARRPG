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
    
    @IBOutlet weak var mainHand: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var mpLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let item = BroadAxe(owner: self.player)
        let item1 = GreatAxe(owner: self.player)
        let item2 = Spatha(owner: self.player)
        player.bag.append(item)
        player.bag.append(item1)
        player.bag.append(item2)
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
    
}
