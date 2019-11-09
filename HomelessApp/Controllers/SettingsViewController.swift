//
//  SettingsViewController.swift
//  HomelessApp
//
//  Created by user on 9/29/19.
//  Copyright © 2019 DiStefanoTeam. All rights reserved.
//

import UIKit

class SettingsViewController: ViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var darkThemeLabel: UILabel!
    @IBOutlet weak var lightThemeLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var russianLabel: UILabel!
    @IBOutlet weak var rulesTitleLabel: UILabel!
    @IBOutlet weak var rulesTextView: UITextView!
    @IBOutlet weak var switchTheme: UISwitch!
    @IBOutlet weak var switchLanguage: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTheme()
        
        switchTheme.isOn = UserDefaults.standard.bool(forKey: "DarkTheme")
        switchLanguage.isOn = UserDefaults.standard.bool(forKey: "English")
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            self.versionLabel.text = "version " + version
        }
    }
    
    func setupTheme() {
        let theme = Theme.currentTheme
        
        self.view.backgroundColor = theme.bgColor
        titleLabel.textColor = theme.textColor
        versionLabel.textColor = theme.textColor
        darkThemeLabel.textColor = theme.textColor
        lightThemeLabel.textColor = theme.textColor
        englishLabel.textColor = theme.textColor
        russianLabel.textColor = theme.textColor
        rulesTitleLabel.textColor = theme.textColor
        rulesTextView.textColor = theme.textColor
        rulesTextView.backgroundColor = theme.bgColor
//        switchTheme.onTintColor = theme.accentColor
//        switchLanguage.onTintColor = theme.accentColor
        
        navigationController?.navigationBar.tintColor = theme.bgColor
        navigationController?.navigationBar.barTintColor = theme.bgColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: theme.textColor]
        tabBarController?.tabBar.barTintColor = theme.bgColor
    }
    
    @IBAction func changeTheme(_ sender: UISwitch) {
        Theme.currentTheme = sender.isOn ? DarkTheme() : LightTheme()
        setupTheme()
        UserDefaults.standard.set(sender.isOn, forKey: "DarkTheme")
        
    }
    
    @IBAction func changeLanguage(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "English")
    }
    
    
    
}
