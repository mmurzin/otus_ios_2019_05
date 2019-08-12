//
//  Localizator.swift
//  homework-1
//
//  Created by michael on 25/07/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

struct Localizator {
    
    let locale:Locale
    
    init(locale: Locale) {
        self.locale = locale
    }
    
    func localizeDates(dates: [Date], dateTemplate:String = "dMMMMyEEEE") -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate(dateTemplate)
        dateFormatter.locale = locale
        
        var items = [String]()
        for date in dates {
            items.append(dateFormatter.string(from: date))
        }
        return items
    }
    
    func localizeUnits(mesaurments: [Measurement<Unit>]) -> [String] {
        var items = [String]()
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.locale = locale
        
        for measurement in mesaurments {
            items.append(measurementFormatter.string(from: measurement))
        }
        return items
    }
}
