import Foundation

class Person{
    var health: Int
    var money: Int
    var eat: Int
    var happiness: Int
    let userDefaults = UserDefaults.standard
    
    static let sharedPerson = Person(health: 0, money: 0, eat: 0, happiness: 0)
    //let person = sharedPerson
    
    private init(health: Int, money: Int, eat: Int, happiness: Int) {
        self.health = health
        self.money = money
        self.eat = eat
        self.happiness = happiness
    }
    
    func saveAll (health: Int, money: Int, eat: Int, happiness: Int) {
        saveHealth(health: health)
        saveMoney(money: money)
        saveEat(eat: eat)
        saveHappiness(happiness: happiness)
    }
    
    func saveHealth (health: Int) {
        userDefaults.set(health, forKey: "person.health")
    }
    
    func saveMoney (money: Int) {
        userDefaults.set(money, forKey: "person.money")
    }
    
    func saveEat (eat: Int) {
        userDefaults.set(eat, forKey: "person.eat")
    }
    
    func saveHappiness (happiness: Int) {
        userDefaults.set(happiness, forKey: "person.happiness")
    }
    
    func loadData() {
        guard userDefaults.object(forKey: "person.health") != nil,
              userDefaults.object(forKey: "person.money") != nil,
              userDefaults.object(forKey: "person.eat") != nil,
              userDefaults.object(forKey: "person.happiness") != nil
        else {
//            let alert = UIAlertController(title: "Нет сохраненных игр", message: "Начать новую игру?", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default)
//            alert.addAction(okAction)
//            self.present(alert, animated: true)
            return
        }      
        
        Person.sharedPerson.health = userDefaults.object(forKey: "person.health") as! Int
        Person.sharedPerson.money = userDefaults.object(forKey: "person.money") as! Int
        Person.sharedPerson.eat = userDefaults.object(forKey: "person.eat") as! Int
        Person.sharedPerson.happiness = userDefaults.object(forKey: "person.happiness") as! Int
    }

//    func newGame() {
//        person.health = 100
//        person.money = 1000
//        person.eat = 100
//        person.happiness = 100
//    }
    
}
