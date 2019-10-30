//
//  ViewController.swift
//  HomelessApp
//
//  Created by user on 10/18/19.
//  Copyright © 2019 DiStefanoTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let person = Person.sharedPerson
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func newGame(_ sender: Any) {
        performSegue(withIdentifier: "new", sender: Any?.self)
    }
    
    @IBAction func continueGame(_ sender: Any) {
        performSegue(withIdentifier: "load", sender: Any?.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "new" {
            person.health = 100
            person.money = 1000
            person.eat = 100
            person.happiness = 100
        } else if segue.identifier == "load" {
            person.loadData()
        }
    }

}
