//
//  ViewController.swift
//  HomelessApp
//
//  Created by user on 10/18/19.
//  Copyright © 2019 DiStefanoTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
            Person.shared.newGame()
            Person.shared.save()
        } else if segue.identifier == "load" {
            Person.shared.loadData()
        }
    }

}
