//
//  DatesSearcher.swift
//  homework-1
//
//  Created by michael on 20/07/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

struct DatesSearcher {
    
    var dateRegex = #"\d{1,2}\/\d{1,2}\/\d{4}"#
    var dateForamt = "dd/MM/yyyy"
    let searcher:Searcher
    
    init(searcher: Searcher = Searcher()) {
        self.searcher = searcher
    }
    
    func search(text: String) -> [Date] {
        let stringDates: [String] = searcher.search(text: text, regexp: dateRegex)
        var dates: [Date] = []
        
        for dateString in stringDates {
            if let date = getDate(foramt: "dd/MM/yyyy", date: dateString) {
                dates.append(date)
            }
        }
        
        return dates
    }
    
    private func getDate(foramt:String, date:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = foramt
        dateFormatter.timeZone = TimeZone(identifier:"GMT")
        return dateFormatter.date(from: date)
    }
}
