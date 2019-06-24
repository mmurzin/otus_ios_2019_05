//
//  TimerViewCell.swift
//  homework-1
//
//  Created by michael on 16/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

class TimerViewCell: UICollectionViewCell {
    
    @IBOutlet weak var stateImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    var timerItem : TimerItem? {
        didSet {
            timeLabel.text = timerItem?.displayTime
            if let image = timerItem?.stateImage {
                stateImageView.image = UIImage(named: image)
            } else {
                stateImageView.image = nil
            }
        }
    }
    
}
