import Foundation
import UIKit

class Person{
    var health: Int
    var money: Int
    var eat: Int
    var happiness: Int
    let userDefaults = UserDefaults.standard
    
    static let shared = Person(health: 0, money: 0, eat: 0, happiness: 0)
    
    private init(health: Int, money: Int, eat: Int, happiness: Int) {
        self.health = health
        self.money = money
        self.eat = eat
        self.happiness = happiness
    }
    
    func save() {
        userDefaults.set(health, forKey: "person.health")
        userDefaults.set(money, forKey: "person.money")
        userDefaults.set(eat, forKey: "person.eat")
        userDefaults.set(happiness, forKey: "person.happiness")
        userDefaults.synchronize()
        print("func save called")
    }
    
//    func saveAll (health: Int, money: Int, eat: Int, happiness: Int) {
//        saveHealth(health: health)
//        saveMoney(money: money)
//        saveEat(eat: eat)
//        saveHappiness(happiness: happiness)
//        print("func save ALL called")
//
//    }
//
//    func saveHealth (health: Int) {
//        userDefaults.set(health, forKey: "person.health")
//    }
//
//    func saveMoney (money: Int) {
//        userDefaults.set(money, forKey: "person.money")
//    }
//
//    func saveEat (eat: Int) {
//        userDefaults.set(eat, forKey: "person.eat")
//    }
//
//    func saveHappiness (happiness: Int) {
//        userDefaults.set(happiness, forKey: "person.happiness")
//    }
    
    func loadData() {
        guard userDefaults.object(forKey: "person.health") != nil,
              userDefaults.object(forKey: "person.money") != nil,
              userDefaults.object(forKey: "person.eat") != nil,
              userDefaults.object(forKey: "person.happiness") != nil
        else {
//            let alert = UIAlertController(title: "Нет сохраненных игр", message: "Начать новую игру?", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default)
//            alert.addAction(okAction)
//            self.present(alert, animation: true)
            return
        }      
        
        Person.shared.health = userDefaults.object(forKey: "person.health") as! Int
        Person.shared.money = userDefaults.object(forKey: "person.money") as! Int
        Person.shared.eat = userDefaults.object(forKey: "person.eat") as! Int
        Person.shared.happiness = userDefaults.object(forKey: "person.happiness") as! Int
        print("func load called")

    }

    func newGame() {
        Person.shared.health = 100
        Person.shared.money = 1000
        Person.shared.eat = 100
        Person.shared.happiness = 100
        print("func new game called")

    }
    
}
