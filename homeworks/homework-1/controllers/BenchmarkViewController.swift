//
//  BenchmarkViewController.swift
//  homework-1
//
//  Created by michael on 09/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

class BenchmarkViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBehaviors(behaviors: [PrintTimerBehavior()])
    }
}
