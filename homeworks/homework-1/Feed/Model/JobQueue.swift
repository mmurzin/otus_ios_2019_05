//
//  JobQueue.swift
//  homework-1
//
//  Created by michael on 28/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

class JobQueue {
    
    var finishedClosure: ((Int64, String) -> ())?
    let label:String
    
    private var group: DispatchGroup
    private var closures: [()->()]
    private var startTs: Int64 = 0
    
    init(label:String) {
        self.group = DispatchGroup()
        self.closures = [()->()]()
        self.label = label
    }
    
    func add(closure: @escaping ()->()) {
        group.enter()
        closures.append(closure)
        if closures.count == 1 {
            configureNotify()
        }
    }
    
    func run() {
        self.startTs = Date().currentTimeMillis()
        DispatchQueue.global(qos: .background).async {
            for closure in self.closures {
                closure()
            }
        }
    }
    
    func leave() {
        self.group.leave()
    }
    
    private func configureNotify() {
        group.notify(queue: .main) {
            self.finishedClosure?(
                Date().currentTimeMillis() - self.startTs,
                self.label)
        }
    }
    
}

