import UIKit

class WorkTableViewController: UITableViewController {
    
    let work = WorkModel.fetchWork()
    let playerCell = "PersonTableViewCell"
    let person = Person.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView.register(UINib(nibName: playerCell, bundle: nil), forCellReuseIdentifier: "player")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupTheme()
        tableView.reloadData()
    }
    
    func setupTheme() {
        let theme = Theme.currentTheme
        
        self.view.backgroundColor = theme.bgColor
        tableView.backgroundColor = theme.bgColor
        tableView.separatorColor = theme.accentColor
        
        navigationController?.navigationBar.tintColor = theme.bgColor
        navigationController?.navigationBar.barTintColor = theme.bgColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: theme.textColor]
        tabBarController?.tabBar.barTintColor = theme.bgColor
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
////            return "Health Eat Happiness Money"
//            return "Здоровье Еда Счастье Деньги"
//        } else { return "" }
//    }
    
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "player") as! PersonTableViewCell
            
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
                cell.textLabel?.textColor = person.workLevel > indexPath.row ? Theme.currentTheme.accentColor : Theme.currentTheme.textColor
                cell.detailTextLabel?.textColor = person.workLevel > indexPath.row ? Theme.currentTheme.accentColor : Theme.currentTheme.textColor
                return cell
            }
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        super.tableView(tableView, heightForRowAt: indexPath)
            return 50.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1 {
            
            guard person.workLevel >= indexPath.row else {
                showCustomAlert(title: "Недостаточно навыков для этой работы", message: "Пройдите пожалуйста все работы по порядку")
                return
            }
            
            work(salary: work[indexPath.row].salary, coeff: indexPath.row)
            person.workLevel = (indexPath.row + 1) > person.workLevel ? (indexPath.row + 1) : person.workLevel
            print("New workLevel is \(person.workLevel)")
            
            tableView.cellForRow(at: indexPath)?.textLabel?.textColor = Theme.currentTheme.accentColor
            tableView.cellForRow(at: indexPath)?.detailTextLabel?.textColor = Theme.currentTheme.accentColor
            tableView.reloadData()
        }
    }
    
    private func work(salary: Int, coeff: Int) {
        let eat = Int.random(in: 1...4) * coeff
        let health = Int.random(in: 1...4) * coeff
        let happiness = Int.random(in: 1...4) * (5 - coeff)
        guard (person.eat - eat) > 0
            else {
                showCustomAlert(title: "Вы слишком голодны", message: "Поднимите уровень сытости, чтобы работать и дальше")
                return
            }
        guard (person.health - health) > 0
            else {
                showCustomAlert(title: "Недостаточно здоровья", message: "Поднимите уровень здоровья, чтобы работать и дальше")
                return
            }
        guard (person.happiness - happiness) >= 0
            else {
                showCustomAlert(title: "Недостаточно счастья", message: "Поднимите уровень счастья, чтобы работать и дальше")
                return
            }
        
        person.eat -= eat
        person.health -= health
        person.happiness -= happiness
        person.money += salary
        
        person.save()
    }
    
}

