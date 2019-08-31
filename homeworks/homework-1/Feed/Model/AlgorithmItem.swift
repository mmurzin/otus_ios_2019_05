//
//  AlgorithmItem.swift
//  homework-1
//
//  Created by michael on 31/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

class AlgorithmItem: Codable {
    let name: String
    var cellBackground: String
    
    init(name: String, cellBackground: String) {
        self.name = name
        self.cellBackground = cellBackground
    }
}
