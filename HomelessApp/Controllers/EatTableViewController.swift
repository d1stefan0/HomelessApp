//
//  EatTableViewController.swift
//  HomelessApp
//
//  Created by user on 10/6/19.
//  Copyright © 2019 DiStefanoTeam. All rights reserved.
//

import UIKit

class EatTableViewController: UITableViewController {
    
    let eat = ["Пожрать на помойке", "Хот-дог", "Кафе", "Закупиться в магазине", "Жениться"]
    let drink = ["Пиво", "Водка", "Виски", "Коньяк ХО", "Пить в баре"]
    let playerCell = "PlayerTableViewCell"
    
    let person = Person.sharedPerson
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: playerCell, bundle: nil), forCellReuseIdentifier: "player")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return eat.count
        } else {
            return drink.count
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        let text: String
        let color: UIColor
        if section == 1 {
            text = "Еда"
            color = .yellow
        } else if section == 2 {
            text = "Напитки"
            color = .red
            header?.textLabel?.text = text
            header?.backgroundColor = color
        }
        return header
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
            
        } else if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
                cell.textLabel?.text = eat[indexPath.row]
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
                cell.textLabel?.text = drink[indexPath.row]
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
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                person.health += 1
                person.money += 1
                person.eat += 1
                person.happiness += 1
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
                print("chosen " + eat[indexPath.row])
            }
            tableView.reloadData()
            
        } else if indexPath.section == 2 {
            switch indexPath.row {
            case 0:
                person.health -= 10
                person.money += 5
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
                print("chosen " + drink[indexPath.row])
            }
            tableView.reloadData()
        }
    }
    
}
