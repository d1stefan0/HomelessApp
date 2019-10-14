import Foundation

class Person{
    var health: Int
    var money: Int
    var eat: Int
    var happiness: Int
    
    static var sharedPerson = Person(health: 100, money: 1000, eat: 100, happiness: 100)
    
    init(health: Int, money: Int, eat: Int, happiness: Int) {
        self.health = health
        self.money = money
        self.eat = eat
        self.happiness = happiness
    }
    
}
