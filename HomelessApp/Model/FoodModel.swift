//
//  WorkModel.swift
//  HomelessApp
//
//  Created by user on 10/18/19.
//  Copyright © 2019 DiStefanoTeam. All rights reserved.
//

import Foundation
import UIKit

struct FoodModel {
    var image: UIImage
    var foodRus: String
    var foodEng: String
    var cost: Int
    
    static func fetchWork () -> [FoodModel] {
        let food1 = FoodModel(image: UIImage(named: "apple")!, foodRus: "Яблоко", foodEng: "Apple", cost: 100)
        let food2 = FoodModel(image: UIImage(named: "burger")!, foodRus: "Фаст-фуд", foodEng: "Apple", cost: 200)
        let food3 = FoodModel(image: UIImage(named: "groceries")!, foodRus: "Закупиться в супермаркете", foodEng: "Apple", cost: 300)
        let food4 = FoodModel(image: UIImage(named: "wine")!, foodRus: "Вино", foodEng: "Apple", cost: 400)
        let food5 = FoodModel(image: UIImage(named: "whiskey")!, foodRus: "Виски", foodEng: "Apple", cost: 500)
        let food6 = FoodModel(image: UIImage(named: "pizza")!, foodRus: "Пиццв", foodEng: "Apple", cost: 600)
        let food7 = FoodModel(image: UIImage(named: "sushi")!, foodRus: "Суши", foodEng: "Apple", cost: 700)
        let food8 = FoodModel(image: UIImage(named: "restaurant")!, foodRus: "Ресторан", foodEng: "Apple", cost: 1000)
        let food9 = FoodModel(image: UIImage(named: "wife")!, foodRus: "Жениться", foodEng: "Apple", cost: 2000)
        return [food1, food2, food3, food4, food5, food6, food7, food8, food9]
    }
}
