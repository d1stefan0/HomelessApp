//
//  WorkModel.swift
//  HomelessApp
//
//  Created by user on 10/18/19.
//  Copyright © 2019 DiStefanoTeam. All rights reserved.
//

import UIKit

struct HealthModel {
    var image: UIImage
    var healthRus: String
    var healthEng: String
    var cost: Int
    
    static func fetchWork () -> [HealthModel] {
        let health1 = HealthModel(image: UIImage(named: "apple")!, healthRus: "Делать зарядку", healthEng: "", cost: 100)
        let health2 = HealthModel(image: UIImage(named: "apple")!, healthRus: "Сделать пробежку", healthEng: "", cost: 200)
        let health3 = HealthModel(image: UIImage(named: "apple")!, healthRus: "Плавать в бассейне", healthEng: "", cost: 400)
        let health4 = HealthModel(image: UIImage(named: "apple")!, healthRus: "Купить абонемент в спорт-зал", healthEng: "Fitness abonement", cost: 600)
        let health5 = HealthModel(image: UIImage(named: "apple")!, healthRus: "Заниматься с тренером", healthEng: "Personal coach", cost: 1000)
        return [health1, health2, health3, health4, health5]
    }
}
