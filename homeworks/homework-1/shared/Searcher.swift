//
//  Searcher.swift
//  homework-1
//
//  Created by michael on 23/07/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

struct Searcher {
    
    func search(text:String, regexp:String) -> [String] {
        var values: [String] = []
        do {
            let regexItem = try NSRegularExpression(pattern: regexp)
            let results = regexItem.matches(in: text,
                                            range: NSRange(text.startIndex..., in: text))
            values = results.map {
                String(text[Range($0.range, in: text)!])
            }
        }  catch let error {
            print("search error \(error)")
        }
        return values
    }
    
}
