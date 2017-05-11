//
//  ShopViewController.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/9/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit


// Create factories for items etc
class ShopViewController: GameViewController {
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var shopTableView: UITableView!
    @IBOutlet weak var bagTableView: UITableView!
    
    var player = Character(withLvl: 1)
    var shopsItems = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shopSetup()
        self.populateShop()
        self.giftMoneyToPlayer()
        self.updateUI()
    }
    
    func shopSetup() {
        self.shopTableView.delegate = self
        self.shopTableView.dataSource = self
        self.bagTableView.delegate = self
        self.bagTableView.dataSource = self
    }
    
    func populateShop() {
       shopsItems = [Spatha(owner: player),BroadAxe(owner: player),KnightsCuirass(owner: player),CrusaderHelm(owner: player),HealthPotion(owner: player),GreatAxe(owner: player),KiteShield(owner: player)]
    }
    
    func giftMoneyToPlayer() {
        self.player.money = 100000
    }
    
    func purchaseItem(item: Item) {
        self.player.money -= item.cost
        self.player.addItemToBag(item: item)
        self.updateUI()
    }
    
    func updateUI(){
        self.currencyLabel.text = "Gold: \(self.player.money)"
        self.bagTableView.reloadData()
        self.shopTableView.reloadData()
    }
}

extension ShopViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case self.shopTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                ?? UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
            cell.textLabel?.text = shopsItems[indexPath.row].name
            cell.detailTextLabel?.text = shopsItems[indexPath.row].desc
            cell.imageView?.image = shopsItems[indexPath.row].image
            return cell
        case self.bagTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                ?? UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
            cell.textLabel?.text = player.bag.contents[indexPath.row].name
            cell.detailTextLabel?.text = player.bag.contents[indexPath.row].desc
            cell.imageView?.image = player.bag.contents[indexPath.row].image
            return cell
        default:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "none")
            print("no such table view")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView {
        case self.shopTableView:
            return shopsItems.count
        case self.bagTableView:
            return player.bag.contents.count
        default:
            print("no such table view")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch tableView {
        case self.shopTableView:
            return "Shop"
        case self.bagTableView:
            return "Bag"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch tableView {
        case self.shopTableView:
            print("Shop at cell#:\(indexPath.row)")
            let newItem = shopsItems[indexPath.row]
            self.purchaseItem(item: newItem)
        case self.bagTableView:
            print("Bag at cell#:\(indexPath.row)")
        default:
            print("no table view for action")
        }
        
    }
}
