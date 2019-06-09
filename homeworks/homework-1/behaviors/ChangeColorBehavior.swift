//
//  ChangeColorBehavior.swift
//  homework-1
//
//  Created by michael on 09/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

class ChangeColorBehavior: ViewControllerLifecycleBehavior {
    
    func afterAppearing(_ viewController: UIViewController) {
        viewController.view.backgroundColor = UIColor.black
        viewController.navigationController?.navigationBar.barStyle = UIBarStyle.black
    }
}
