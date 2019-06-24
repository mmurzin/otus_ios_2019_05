//
//  TimerItem.swift
//  homework-1
//
//  Created by michael on 16/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

class TimerItem {
    var time: Double = 0.0
    var displayTime: String = "00:00:00"
    var stateImage: String? = nil
    
    func increment(_ interval:Double) -> Bool {
        let oldValue = Int(time)
        time += interval
        let current = Int(time)
        if(current > oldValue){
            displayTime = formatTime(current)
            return true
        }
        return false
    }
    
    func formatTime(_ timeInSeconds: Int) -> String {
        return "\(String(format: "%02d", (timeInSeconds / 3600)))" +
        ":\(String(format: "%02d", (timeInSeconds % 3600) / 60))" +
        ":\(String(format: "%02d", (timeInSeconds % 3600) % 60))"
    }
    
    func showPlayButton() {
        stateImage = "play"
    }
    
    func showPauseButton() {
        stateImage = "pause"
    }
}
