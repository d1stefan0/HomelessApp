import UIKit

class EducationTableViewController: UITableViewController {
    
    let education = EducationModel.fetchWork()
    let playerCell = "PlayerTableViewCell"
    let person = Person.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        // Set resizable table bounds
        self.tableView.frame = self.view.bounds
        self.tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return education.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
//            return "Health Eat Happiness Money"
            return "Здоровье Еда Счастье Деньги"
        } else { return "" }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell: PlayerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "player", for: indexPath) as! PlayerTableViewCell
            
            cell.healthLabel.text = String(person.health)
            cell.moneyLabel.text = String(person.money)
            cell.eatLabel.text = String(person.eat)
            cell.happinessLabel.text = String(person.happiness)
            
            return cell
            
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
                cell.textLabel?.text = education[indexPath.row].educationRus
                cell.detailTextLabel?.text = "$\(education[indexPath.row].price)"
                cell.textLabel?.textColor = person.educationLevel > indexPath.row ? Theme.currentTheme.accentColor : Theme.currentTheme.textColor
                cell.detailTextLabel?.textColor = person.educationLevel > indexPath.row ? Theme.currentTheme.accentColor : Theme.currentTheme.textColor
                cell.imageView?.image = education[indexPath.row].image
                
                return cell
            }
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        super.tableView(tableView, heightForRowAt: indexPath)
            return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1 {
            
            guard person.educationLevel >= indexPath.row else {
                showCustomAlert(title: "Недостаточно знаний", message: "Пройдите обучение по порядку")
                return
            }
            
            if study(price: education[indexPath.row].price) {
                print("New educationLevel is \(person.educationLevel + 1)")
                person.educationLevel += 1
                tableView.cellForRow(at: indexPath)?.textLabel?.textColor = Theme.currentTheme.accentColor
                tableView.cellForRow(at: indexPath)?.detailTextLabel?.textColor = Theme.currentTheme.accentColor
                tableView.cellForRow(at: indexPath)?.isUserInteractionEnabled = false
            }
            //tableView.reloadData()
        }
    }
    
    private func study(price: Int) -> Bool {
        if person.money >= price {
            person.money -= price
            person.save()
            showCustomAlert(title: "Поздравляем", message: "Вы получили очередную ступень образования")
            return true
            
        } else {
            showCustomAlert(title: "Недостаточно денег", message: "Для получения образования нужно минимум \(price) долларов")
            return false
        }
    }
    
}

extension UITableViewController {
    func showCustomAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.view.backgroundColor = UIColor.black
        alert.view.tintColor = UIColor.white
        alert.view.layer.cornerRadius = 25
        //alert.view.center
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
             alert.dismiss(animated: true, completion: nil)
        }
    }
}
