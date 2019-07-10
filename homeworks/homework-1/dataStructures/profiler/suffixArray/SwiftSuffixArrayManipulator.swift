//
//  SwiftSuffixArrayManipulator.swift
//  homework-1
//
//  Created by michael on 01/07/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

class SwiftSuffixArrayManipulator: SuffixArrayManipulator {
    
    var algoSuffixArray:[(suffix: String, algoName: String)] = []
    var randomSuffixArray:[(suffix: String, algoName: String)] = []
    
    func arrayHasObjects() -> Bool {
        if randomSuffixArray.count == 0 {
            return false
        } else {
            return true
        }
    }
    
    func setupWithSize(_ size: Int) -> TimeInterval {
        return Profiler.runClosureForTime() {
            self.randomSuffixArray = self.createSuffixArray(
                items: self.randomizeWords(size: size, wordSize: 14), reverse: false)
        }
    }
    
    func setupWithObjects(items: [String], reverse: Bool) -> TimeInterval {
        let time = Profiler.runClosureForTime() {
            self.algoSuffixArray = self.createSuffixArray(items: items, reverse: reverse)
        }
        print("creation \(time)")
        return time
    }
    
    func searchRandomWords(count: Int, wordSize: Int) -> TimeInterval {
        let time =  Profiler.runClosureForTime() {
            let words = self.randomizeWords(size: count, wordSize: wordSize)
            for word in words {
                let result = self.search(query: word, suffixArray: self.algoSuffixArray)
                print(result)
            }
        }
        print("search \(time)")
        return time
    }
    
    private func randomizeWords(size: Int, wordSize: Int) -> [String] {
        var words: [String] =  []
        var value = 0
        let stringGenerator = StringGenerator()
        while value < size {
            words.append(stringGenerator.generateRandomString(wordSize))
            value += 1
        }
        return words
    }
    
    private func createSuffixArray(items: [String], reverse: Bool) -> [(suffix: String, algoName: String)] {
        var suffixArray:[(suffix: String, algoName: String)] = []
        for word in items {
            if(reverse) {
                for suffix in InverseSuffixSequence(string: word) {
                    print("create suffix = \(suffix)")
                    suffixArray
                        .append((suffix: String(suffix), algoName: word))
                }
            } else {
                for suffix in SuffixSequence(string: word) {
                    print("create suffix = \(suffix)")
                    suffixArray
                        .append((suffix: String(suffix), algoName: word))
                }
            }
        }
        suffixArray.sort {
            $0.suffix < $1.suffix
        }
        return suffixArray
    }
    
    func search(query: String, suffixArray: [(suffix: String, algoName: String)]) -> [String] {
        var result = Set<String>()
        let queryPrefix = query.prefix(1)
        var isPrefixGroupFounded = false
        for item in suffixArray {
            if(queryPrefix == item.suffix.prefix(1)){
                print("suffix = \(item.suffix)")
                isPrefixGroupFounded = true
            }
            
            if(isPrefixGroupFounded && queryPrefix != item.suffix.prefix(1)) {
                break
            }
            
            if(isPrefixGroupFounded && item.suffix == query) {
                result.insert(item.algoName)
            }
        }
        return Array(result)
    }
    
    func searchAlgoName(query: String) -> [String] {
        return search(query: query, suffixArray: algoSuffixArray)
    }
    
}


