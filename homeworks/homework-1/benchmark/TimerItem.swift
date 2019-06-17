//
//  TimerItem.swift
//  homework-1
//
//  Created by michael on 16/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

class TimerItem {
    var time: Int = 0
    var displayTime: String = "00:00:00"
    var stateImage: String? = nil
    
    func increment() {
        time += 1
        displayTime = formatTime()
    }
    
    func formatTime() -> String {
        
        return "\(String(format: "%02d", (time / 3600)))" +
        ":\(String(format: "%02d", (time % 3600) / 60))" +
        ":\(String(format: "%02d", (time % 3600) % 60))"
    }
    
    func start() {
        
    }
    
    func pause() {
        
    }
}
