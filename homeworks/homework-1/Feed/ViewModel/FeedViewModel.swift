//
//  FeedViewModel.swift
//  homework-1
//
//  Created by michael on 12/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

final class FeedViewModel {
    
    var dataItems:[AlgorithmItem] = [AlgorithmItem]()
    var filteterdDataItems:[AlgorithmItem] = []
    let repository: AlgorithmRepository
    //var sortedPositions = [String: Int]()
    var testsRunned = false
    private var searchHelper = SearchHelper()
    private var resultColors = [String]()
    
    
    private let tasksCount = 10_000
    private let testsCount = 4
    private let suffixArrayManipulator: SuffixArrayManipulator = SwiftSuffixArrayManipulator()
    
    private var binder:((ViewModelState) -> ())? = nil
    private var testResults = [String: Int64]()
    
    init(repository: AlgorithmRepository) {
        self.repository = repository
        self.initializeResultColors()
    }
    
    
    func search(query: String){
        /*
        filteterdDataItems = suffixArrayManipulator.searchAlgoName(query: query)
        print("\(filteterdDataItems)")
        self.binder?(.result)
        */
    }
    
    func bind(_ binder: @escaping (ViewModelState) -> ()) {
        self.binder = binder
        /*
        let _ = suffixArrayManipulator.setupWithObjects(
            items:dataItems, reverse:true)
        self.binder?(.result)
        */
        repository.getItems{ items in
            self.dataItems = items
            self.binder?(.result)
        }
    }
    
    func runTasks() {
        var jobs = [JobQueue]()
        let scheduler = JobScheduler()
        self.testsRunned = true
        self.binder?(.result)
        var testedItems = [String: AlgorithmItem]()
        
        for index in 0...testsCount - 1 {
            let algorithmItem = self.dataItems[index]
            let q = JobQueue(label: algorithmItem.name)
            testedItems[algorithmItem.name] = algorithmItem
            switch index {
                case 0:
                    var array = [Int]()
                    for j in 0 ..< tasksCount {
                        q.add {
                            array.append(j)
                            q.leave()
                        }
                    }
                    break
                case 1:
                    var set =
                        Set<String>(minimumCapacity: tasksCount)
                    let generator = StringGenerator()
                    for _ in 0 ..< tasksCount {
                        q.add {
                            set.insert(
                                generator.standardRandomString())
                            q.leave()
                        }
                    }
                    break
                case 2:
                    var dictionary = [Int: Int]()
                    for j in 0 ..< tasksCount {
                        q.add {
                            dictionary.updateValue(j, forKey: j + 1)
                            q.leave()
                        }
                    }
                    break
                case 3:
                    var suffixArray:[(suffix: String, algoName: String)] = []
                    let words = SwiftSuffixArrayManipulator.randomizeWords(size: tasksCount, wordSize: SwiftSuffixArrayManipulator.DEFAULT_WORD_SIZE)
                    
                    for word in words {
                        q.add {
                            for suffix in SuffixSequence(string: word) {
                                suffixArray
                                    .append((suffix: String(suffix), algoName: word))
                            }
                            q.leave()
                        }
                    }
                    q.add {
                        suffixArray.sort {
                            $0.suffix < $1.suffix
                        }
                        q.leave()
                    }
                    break
                default:
                    print("index error \(index)")
            }
            jobs.append(q)
        }
        scheduler.scheduleChunk(jobs: jobs,
                                finishedCompletion: {testResults in
            self.testsRunned = false
            let sortedTestResults = testResults.sorted { $0.1 < $1.1 }
            var index = 0
            for (key,_) in sortedTestResults {
                testedItems[key]?.cellBackground = self.resultColors[index]
                index += 1
            }
            self.repository.cacheData(self.dataItems)
            self.binder?(.result)
        })
    }
    
    private func initializeResultColors() {
        resultColors.append("#00ff00")
        resultColors.append("#eeee00")
        resultColors.append("#ffa500")
        resultColors.append("#ff0000")
    }
}
