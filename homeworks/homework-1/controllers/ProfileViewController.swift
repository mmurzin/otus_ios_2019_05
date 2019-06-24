//
//  ProfileViewController.swift
//  homework-1
//
//  Created by michael on 09/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var statusBarStyle: UIStatusBarStyle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBehaviors(behaviors: [ChangeColorBehavior(), HideNavigationBarBehavior()])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle ?? .default
    }

}
