import Foundation
import UIKit

class Person{
    var health: Int = 100
    var money: Int = 100
    var eat: Int = 100
    var happiness: Int = 100
    var educationLevel: Int = 0
    var workLevel: Int = 0
    let userDefaults = UserDefaults.standard
    
    static let shared = Person()
    
//    private init(health: Int, money: Int, eat: Int, happiness: Int) {
//        self.health = health
//        self.money = money
//        self.eat = eat
//        self.happiness = happiness
//    }
    
    func save() {
        userDefaults.set(health, forKey: "health")
        userDefaults.set(money, forKey: "money")
        userDefaults.set(eat, forKey: "eat")
        userDefaults.set(happiness, forKey: "happiness")
        userDefaults.set(educationLevel, forKey: "educationLevel")
        userDefaults.set(workLevel, forKey: "workLevel")
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
        guard userDefaults.object(forKey: "health") != nil,
              userDefaults.object(forKey: "money") != nil,
              userDefaults.object(forKey: "eat") != nil,
              userDefaults.object(forKey: "happiness") != nil,
              userDefaults.object(forKey: "educationLevel") != nil,
              userDefaults.object(forKey: "workLevel") != nil
        else {
//            let alert = UIAlertController(title: "Нет сохраненных игр", message: "Начать новую игру?", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default)
//            alert.addAction(okAction)
//            self.present(alert, animation: true)
            print("found nil in person.propoertie")
            print("new game started")
            newGame()
            return
        }      
        
        Person.shared.health = userDefaults.object(forKey: "health") as! Int
        Person.shared.money = userDefaults.object(forKey: "money") as! Int
        Person.shared.eat = userDefaults.object(forKey: "eat") as! Int
        Person.shared.happiness = userDefaults.object(forKey: "happiness") as! Int
        Person.shared.educationLevel = userDefaults.object(forKey: "educationLevel") as! Int
        Person.shared.workLevel = userDefaults.object(forKey: "workLevel") as! Int
        print("func load called")
    }

    func newGame() {
        Person.shared.health = 100
        Person.shared.money = 100
        Person.shared.eat = 100
        Person.shared.happiness = 100
        Person.shared.educationLevel = 0
        Person.shared.workLevel = 0
        print("func new game called")
    }
    
}
