//
//  SuffixArrayManipulator.swift
//  homework-1
//
//  Created by michael on 01/07/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

protocol SuffixArrayManipulator {
    func arrayHasObjects() -> Bool
    func setupWithSize(_ size: Int) -> TimeInterval
    func setupWithObjects(_ items: [String]) -> TimeInterval
    func searchRandomWords(count: Int, wordSize: Int) -> TimeInterval
}
