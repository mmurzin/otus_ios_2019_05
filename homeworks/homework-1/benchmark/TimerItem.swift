//
//  TimerItem.swift
//  homework-1
//
//  Created by michael on 16/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

class TimerItem {
    var duration: Double = 0.0
    var pausedTime: Double = 0.0
    var displayTime: String = "00:00:00"
    var stateImage: String? = nil
    
    func incrementDuration(_ interval:Double) -> Bool {
        let oldValue = Int(duration)
        duration += interval
        let current = Int(duration)
        if(current > oldValue) {
            displayTime = formatTime(current)
            return true
        }
        return false
    }
    
    func incrementPausedTime(_ interval:Double) -> Bool {
        let oldValue = Int(pausedTime)
        pausedTime += interval
        let current = Int(pausedTime)
        if(current > oldValue) {
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
