//
//  BenchmarkViewModel.swift
//  homework-1
//
//  Created by michael on 04/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation
import RxSwift

class BenchmarkViewModel {
    
    var timers:[TimerItem]? = nil
    var isAutoUpdateChart = true
    var updatedRow = 0
    private var timer:Timer?
    
    private let repository: TimerItemsRepository
    private let disposeBag = DisposeBag()
    
    private var binder:((ViewModelState) -> ())? = nil
    
    init(repository: TimerItemsRepository) {
        self.repository = repository
    }
    
    func bind(_ binder: @escaping (ViewModelState) -> ()) {
        self.binder = binder
        self.loadTimerItems()
        self.initializeTickingTimer()
    }
    
    func unBind() {
        self.binder = nil
    }
    
    func didSelectTimer(row: Int){
        let timerItem = repository.timers[row]
        
        print("launched \(String(describing: repository.launchedTimers[row]))")
        print("paused \(String(describing: repository.pausedTimers[row]))")
        
        if repository.launchedTimers[row] != nil {
            timerItem.showPlayButton()
            repository.pausedTimers[row] = repository.timers[row]
            repository.launchedTimers.removeValue(forKey: row)
        } else {
            timerItem.showPauseButton()
            repository.launchedTimers[row] = repository.timers[row]
            repository.pausedTimers.removeValue(forKey: row)
        }
        updateCell(row: row)
    }
    
    private func loadTimerItems() {
        repository.getRemoteAlgorithmItems()
        .subscribe { event in
            switch event {
            case .success(let items):
                self.timers = items
                self.binder?(.result)
            case .error(let error):
                print(error)
            }
        }
        .disposed(by: self.disposeBag)
    }
    
    private func updateCell(row:Int) {
        self.updatedRow = row
        self.binder?(.result)
    }


    private func initializeTickingTimer(){
        let interval = 0.1
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            for(index, timer) in self.repository.launchedTimers {
                timer.incrementDuration(interval)
                self.updateCell(row: index)
            }
            
            for(index, timer) in self.repository.pausedTimers {
                timer.incrementPausedTime(interval)
                self.updateCell(row: index)
            }
        }
    }
}
