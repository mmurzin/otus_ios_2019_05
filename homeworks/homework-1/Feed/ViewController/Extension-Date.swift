//
//  Extension-Date.swift
//  homework-1
//
//  Created by michael on 29/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
