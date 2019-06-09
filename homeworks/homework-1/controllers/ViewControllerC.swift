//
//  ViewControllerC.swift
//  homework-1
//
//  Created by michael on 09/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

class ViewControllerC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func popToRootController() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func popWithChangeStack() {
        if let firstController = navigationController?.viewControllers.first {
            navigationController?.setViewControllers([firstController], animated: true)
        }
    }

}
