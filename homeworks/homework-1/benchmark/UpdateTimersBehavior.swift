//
//  UpdateTimersBehavior.swift
//  homework-1
//
//  Created by michael on 16/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

class UpdateTimersBehavior: ViewControllerLifecycleBehavior {
    
    var timer:Timer?
    var launchedTimers: [IndexPath:TimerItem] = [:]
    var pausedTimers: [IndexPath:TimerItem] = [:]
    
    func afterAppearing(_ viewController: UIViewController) {
        let interval = 0.1
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            for(index, timer) in self.launchedTimers {
                timer.incrementDuration(interval)
                if(viewController is BenchmarkViewController) {
                    (viewController as! BenchmarkViewController).updateCell(index)
                }
            }
            
            for(index, timer) in self.pausedTimers {
                timer.incrementPausedTime(interval)
                if(viewController is BenchmarkViewController) {
                    (viewController as! BenchmarkViewController).updateCell(index)
                }
            }
        }
        
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        if let controller = viewController as? BenchmarkViewController {
            controller.resetTimers()
        }
        launchedTimers.removeAll()
        pausedTimers.removeAll()
        timer?.invalidate()
    }
    
    func didSelectTimer(_ path:IndexPath, _ timerItem: TimerItem) {
        if launchedTimers[path] != nil {
            timerItem.showPlayButton()
            pausedTimers[path] = timerItem
            launchedTimers.removeValue(forKey: path)
        } else {
            timerItem.showPauseButton()
            launchedTimers[path] = timerItem
            pausedTimers.removeValue(forKey: path)
        }
    }
    
}
