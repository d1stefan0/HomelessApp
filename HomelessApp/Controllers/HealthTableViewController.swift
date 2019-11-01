//
//  HealthTableViewController.swift
//  HomelessApp
//
//  Created by user on 10/9/19.
//  Copyright © 2019 DiStefanoTeam. All rights reserved.
//

import UIKit

class HealthTableViewController: UITableViewController {
    
    let health = HealthModel.fetchWork()
    let playerCell = "PlayerTableViewCell"
    let person = Person.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: playerCell, bundle: nil), forCellReuseIdentifier: "player")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return health.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "player") as! PlayerTableViewCell
            
            cell.healthLabel.text = String(person.health)
            cell.moneyLabel.text = String(person.money)
            cell.eatLabel.text = String(person.eat)
            cell.happinessLabel.text = String(person.happiness)
            cell.layoutSubviews()
            
            return cell
            
        } else {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
                cell.textLabel?.text = health[indexPath.row].healthRus
                cell.detailTextLabel?.text = "$\(health[indexPath.row].cost)"
                cell.imageView?.image = health[indexPath.row].image
                return cell
            }
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        super.tableView(tableView, heightForRowAt: indexPath)
        if indexPath.section == 0 {
            return 100.0
        } else {
            return 50.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1 {
            
            health(cost: health[indexPath.row].cost)
            tableView.reloadData()
        }
    }
    
        private func health(cost: Int) {
            person.money -= cost
            person.eat += Int.random(in: 0...5)
            person.health += Int.random(in: 0...5)
            person.happiness += Int.random(in: 0...5)
        
            person.save()
        }
        
}
