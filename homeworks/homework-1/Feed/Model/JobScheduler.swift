//
//  JobScheduler.swift
//  homework-1
//
//  Created by michael on 29/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

class JobScheduler {
    private var statuses = [String:JobStatus]()
    
    func scheduleChunk(jobs:[JobQueue],
                       finishedCompletion:@escaping ([String: Int64])->()){
        var testResults = [String: Int64]()
        var finishedTasks = 0
        for job in jobs {
            self.statuses[job.label] = JobStatus.STARTED
            job.finishedClosure = {(time, label) in
                self.statuses[job.label] = JobStatus.FINISHED
                testResults[job.label] = time
                finishedTasks += 1
                print("finished: \(label) time: \(time)")
                if(finishedTasks == jobs.count) {
                    finishedCompletion(testResults)
                }
            }
            job.run()
        }
    }
    
    enum JobStatus {
        case STARTED
        case FINISHED
    }
}
