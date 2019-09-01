//
//  SearchHelper.swift
//  homework-1
//
//  Created by michael on 31/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

struct SearchHelper {
    var items = [AlgorithmItem](){
        didSet{
            dictionary.removeAll()
            for item in items {
                dictionary[item.name] = item
                names.append(item.name)
            }
        }
    }
    var names = [String]()
    private var dictionary = [String: AlgorithmItem]()
    
    func wrapToItems(names: [String]) -> [AlgorithmItem] {
        var items = [AlgorithmItem]()
        for name in names {
            let item = dictionary[name]
            if(item != nil){
                items.append(item!)
            }
        }
        return items
    }
}
