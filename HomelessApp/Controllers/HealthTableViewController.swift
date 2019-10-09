//
//  HealthTableViewController.swift
//  HomelessApp
//
//  Created by user on 10/9/19.
//  Copyright © 2019 DiStefanoTeam. All rights reserved.
//

import UIKit

class HealthTableViewController: UITableViewController {
    
    let health = ["Таблетки с помойки", "Полечиться у бабки", "Настоящий доктор", "Нормальная клиника", "Полечиться за границей"]
    let playerCell = "PlayerTableViewCell"
    
    let person = Person.sharedPerson
    
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
                cell.textLabel?.text = health[indexPath.row]
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
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            person.health -= 1
            person.money -= 1
            person.eat -= 1
            person.happiness -= 1
        case 1:
            person.health -= 12
            person.money += 8
            person.eat -= 1
            person.happiness -= 1
        case 2:
            person.health -= 10
            person.money += 5
            person.eat -= 1
            person.happiness -= 1
        case 3:
            person.health -= 12
            person.money += 8
            person.eat -= 1
            person.happiness -= 1
        case 4:
            person.health -= 10
            person.money += 5
            person.eat -= 1
            person.happiness -= 1
        default:
            print("chosen " + health[indexPath.row])
        }
        tableView.reloadData()
    }
}
