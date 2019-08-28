//
//  FeedViewModel.swift
//  homework-1
//
//  Created by michael on 12/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

final class FeedViewModel {
    
    var dataItems:[String] = Services.feedProvider.feedData()
    var filteterdDataItems:[String] = []
    var sortedPositions = [String: Int]()
    
    private let tasksCount = 1_000
    private let testsCount = 4
    private let suffixArrayManipulator: SuffixArrayManipulator = SwiftSuffixArrayManipulator()
    
    private var binder:((ViewModelState) -> ())? = nil
    private var testResults = [String: Int64]()
    
    
    func search(query: String){
        filteterdDataItems = suffixArrayManipulator.searchAlgoName(query: query)
        print("\(filteterdDataItems)")
        self.binder?(.result)
    }
    
    func bind(_ binder: @escaping (ViewModelState) -> ()) {
        self.binder = binder
        dataItems.append(contentsOf: Services.algoProvider.all)
        let _ = suffixArrayManipulator.setupWithObjects(
            items:dataItems, reverse:true)
        self.binder?(.result)
    }
    
    func runTasks() {
        var finishedTasks = 0
        
        for index in 0...testsCount - 1 {
            let algorithmName = self.dataItems[index]
            let q = JobQueue(label: algorithmName)
            q.finishedClosure = {(time, label) in
                finishedTasks += 1
                self.testResults[label] = time
                print("finished: \(label) time: \(time)")
                if(finishedTasks == self.testsCount){
                    
                    let sortedtestResults = self.testResults.sorted { $0.1 < $1.1 }
                    var position = 0
                    for (key,_) in sortedtestResults {
                        self.sortedPositions[key] = position
                        position += 1
                    }
                    print(self.sortedPositions)
                    self.binder?(.result)
                }
            }
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
            q.run()
        }
    }
}
