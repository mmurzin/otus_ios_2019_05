//
//  TabBarViewController.swift
//  homework-1
//
//  Created by michael on 15/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return  self.viewControllers?.last?.preferredStatusBarStyle ?? .default
    }
}
