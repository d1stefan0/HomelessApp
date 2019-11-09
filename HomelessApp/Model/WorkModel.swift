//
//  WorkModel.swift
//  HomelessApp
//
//  Created by user on 10/18/19.
//  Copyright © 2019 DiStefanoTeam. All rights reserved.
//

import UIKit

struct WorkModel {
    var image: UIImage
    var workRus: String
    var workEng: String
    var salary: Int
    
    static func fetchWork () -> [WorkModel] {
        let work1 = WorkModel(image: UIImage(named: "man")!, workRus: "Мыть машины", workEng: "", salary: 10)
        let work2 = WorkModel(image: UIImage(named: "man")!, workRus: "Мести улицы", workEng: "", salary: 20)
        let work3 = WorkModel(image: UIImage(named: "man")!, workRus: "Работать грузчиком", workEng: "", salary: 30)
        let work4 = WorkModel(image: UIImage(named: "man")!, workRus: "Работать на заводе", workEng: "", salary: 55)
        let work5 = WorkModel(image: UIImage(named: "man")!, workRus: "Работать в офисе", workEng: "", salary: 100)
        let work6 = WorkModel(image: UIImage(named: "man")!, workRus: "Работать на себя", workEng: "", salary: 200)
        let work7 = WorkModel(image: UIImage(named: "boss")!, workRus: "Управлять компанией", workEng: "", salary: 500)
        let work8 = WorkModel(image: UIImage(named: "boss")!, workRus: "Зарабатывать на бирже", workEng: "", salary: 1000)
        let work9 = WorkModel(image: UIImage(named: "boss")!, workRus: "Стать депутатом", workEng: "", salary: 5000)
        let work10 = WorkModel(image: UIImage(named: "boss")!, workRus: "Управлять страной", workEng: "", salary: 10000)
        return [work1, work2, work3, work4, work5, work6, work7, work8, work9, work10]
    }
}
