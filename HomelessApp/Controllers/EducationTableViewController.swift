import UIKit

class EducationTableViewController: UITableViewController {
    
    let educationImage = [UIImage(named: "blackboard"), UIImage(named: "backpack"), UIImage(named: "univer"), UIImage(named: "diploma"), UIImage(named: "university")]
    let education = ["Выучить таблицу умножения", "Закончить школу", "Закончить ВУЗ", "Купить мастер-класс", "Учиться за границей"]
    let educationPrice = [0, 200, 500, 1000, 5000]
    let playerCell = "PlayerTableViewCell"
    let person = Person.sharedPerson
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        person.loadData()
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
            return education.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "player") as! PlayerTableViewCell
            
            cell.healthLabel.text = String(person.health)
            cell.moneyLabel.text = String(person.money)
            cell.eatLabel.text = String(person.eat)
            cell.happinessLabel.text = String(person.happiness)
            
            return cell
            
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
                cell.imageView?.image = educationImage[indexPath.row]
                cell.textLabel?.text = education[indexPath.row]
                cell.detailTextLabel?.text = "$" + String( educationPrice[indexPath.row])
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
            if study(price: educationPrice[indexPath.row]) {
                tableView.cellForRow(at: indexPath)?.textLabel?.textColor = .gray
                tableView.cellForRow(at: indexPath)?.detailTextLabel?.textColor = .gray
                tableView.cellForRow(at: indexPath)?.isUserInteractionEnabled = false
            }
            tableView.reloadData()
        }
    }
    
    private func study(price: Int) -> Bool {
        if person.money >= price {
            person.money -= price
            person.saveMoney(money: person.money)
            
            let alert = UIAlertController(title: "Поздравляем", message: "Вы получили очередную ступень образования", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
            
            return true
        } else {
            let alert = UIAlertController(title: "Недостаточно денег", message: "Для получения образования нужно минимум \(price) долларов", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
            
            return false
        }
    }
    
}
