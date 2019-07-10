//
//  Services.swift
//  homework-1
//
//  Created by michael on 30/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

class Services {
    static var feedProvider: FeedDataProvider = {
        return FeedDataProvider()
    }()
    
    static var algoProvider: AlgoProvider = {
        return AlgoProvider()
    }()
}
