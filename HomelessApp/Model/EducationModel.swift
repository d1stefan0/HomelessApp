//
//  EducationModel.swift
//  HomelessApp
//
//  Created by user on 11/2/19.
//  Copyright © 2019 DiStefanoTeam. All rights reserved.
//

import UIKit

struct EducationModel {
    var image: UIImage
    var educationRus: String
    var educationEng: String
    var price: Int
    
    static func fetchWork () -> [EducationModel] {
        let education1 = EducationModel(image: UIImage(named: "blackboard")!, educationRus: "Выучить таблицу умножения", educationEng: "", price: 0)
        let education2 = EducationModel(image: UIImage(named: "backpack")!, educationRus: "Закончить школу", educationEng: "", price: 200)
        let education3 = EducationModel(image: UIImage(named: "univer")!, educationRus: "Закончить ВУЗ", educationEng: "", price: 500)
        let education4 = EducationModel(image: UIImage(named: "diploma")!, educationRus: "Купить мастер-класс", educationEng: "", price: 1000)
        let education5 = EducationModel(image: UIImage(named: "university")!, educationRus: "Учиться за границей", educationEng: "", price: 5000)
        return [education1, education2, education3, education4, education5]
    }
}
