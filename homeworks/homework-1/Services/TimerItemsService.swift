//
//  TimerItemsService.swift
//  homework-1
//
//  Created by michael on 12/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

protocol TimerItemsProvider {
    func getTimersList() -> [TimerItem]
}

class TimerItemsService: TimerItemsProvider {
    let timerCount: Int
    
    init(timerCount:Int = 30) {
        self.timerCount = timerCount
    }
    func getTimersList() -> [TimerItem] {
        var timers = [TimerItem]()
        for _ in 0...self.timerCount {
            timers.append(TimerItem())
        }
        return timers
    }
}
