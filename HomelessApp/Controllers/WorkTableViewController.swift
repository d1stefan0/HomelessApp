import UIKit

class WorkTableViewController: UITableViewController {
    
    let work = WorkModel.fetchWork()
    let playerCell = "PlayerTableViewCell"
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
                cell.textLabel?.text = work[indexPath.row].workRus
                cell.detailTextLabel?.text = "$\(work[indexPath.row].salary)"
                cell.imageView?.image = work[indexPath.row].image
                cell.detailTextLabel?.textColor = .green
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
            return 60.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1 {
            
            work(salary: work[indexPath.row].salary)
            tableView.reloadData()
        }
    }
    
    private func work(salary: Int) {
        person.money += salary
        person.eat -= Int.random(in: 0...5)
        person.health -= Int.random(in: 0...5)
        person.happiness -= Int.random(in: 0...5)
    
        person.saveAll(health: person.health, money: person.money, eat: person.eat, happiness: person.happiness)
    }
    
}

