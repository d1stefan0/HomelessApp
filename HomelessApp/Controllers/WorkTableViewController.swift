import UIKit

class WorkTableViewController: UITableViewController {
    
    let work = [
    "Мыть машины", "Мести улицы", "Работать грузчиком"
    ]
    let playerCell = "PlayerTableViewCell"
    //   var person1 = Person(health: 90, money: 90)
    //   var person1: Person?
    
    let person = Person.sharedPerson
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: playerCell, bundle: nil), forCellReuseIdentifier: "player")
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return work.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //
        //        cell.textLabel?.text = Work.allCases[indexPath.row].rawValue
        //        return cell
        //
        
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
                cell.textLabel?.text = work[indexPath.row]
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
                person.health -= 10
                person.money += 5
                person.eat -= 1
                person.happiness -= 1
                
            case 1:
                person.health -= 12
                person.money += 8
                person.eat -= 1
                person.happiness -= 1
            default:                
                print("chosen " + work[indexPath.row])
            }
            
            tableView.reloadData()
        }
    }
    
}

