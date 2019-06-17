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
    
    func afterAppearing(_ viewController: UIViewController) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            for(index, timer) in self.launchedTimers {
               timer.increment()
                if let controller = viewController as? BenchmarkViewController {
                    controller.updateCell(index)
                }
            }
            
        }
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        if let controller = viewController as? BenchmarkViewController {
            controller.resetTimers()
        }
        launchedTimers.removeAll()
        timer?.invalidate()
    }
    
    func didSelectTimer(_ path:IndexPath, _ timerItem: TimerItem){
        if launchedTimers[path] != nil {
            launchedTimers.removeValue(forKey: path)
        } else {
            launchedTimers[path] = timerItem
        }
    }
    
}
