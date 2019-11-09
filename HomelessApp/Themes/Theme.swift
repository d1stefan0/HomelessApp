//
//  Theme.swift
//  HomelessApp
//
//  Created by user on 11/9/19.
//  Copyright © 2019 DiStefanoTeam. All rights reserved.
//

import UIKit

protocol ThemeProtocol {
    var bgColor: UIColor { get }
    var textColor: UIColor { get }
    var accentColor: UIColor { get }
}

class Theme {
    static var currentTheme: ThemeProtocol = LightTheme()
    
}
