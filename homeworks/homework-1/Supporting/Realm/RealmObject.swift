//
//  RealmObject.swift
//  homework-1
//
//  Created by michael on 16/09/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation
import RealmSwift
import DynamicJSON

public class RealmObject: Object {
    
    convenience required init(data: JSON) {
        self.init()
    }
}
