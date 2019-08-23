//
//  SessionSummaryViewController.swift
//  homework-1
//
//  Created by michael on 16/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

class SessionSummaryViewController: UIViewController {
    @IBOutlet weak var itemLabel: UILabel!
    
    var itemName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !itemName.isEmpty {
            itemLabel.text = "Launched from \(itemName)"
        }
        
    }

}
