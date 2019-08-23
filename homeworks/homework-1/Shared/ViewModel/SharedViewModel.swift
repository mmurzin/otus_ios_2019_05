//
//  SharedViewModel.swift
//  homework-1
//
//  Created by michael on 26/07/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation


struct SharedViewModel {
    
    let sharedText:String
    
    var resultItems = [String]()
    var locales = [Locale]()
    var selectedLocaleIndex: Int = 0 {
        didSet {
            loadLocalizedData()
        }
    }
    
    private let datesSearcher = DatesSearcher()
    private let unitsSearcher = UnitsSearcher()
    
    private var datesInText = [Date]()
    private var measurementInText = [Measurement]()
    private var binder:((ViewModelState) -> ())? = nil
    
    
    
    init(text:String) {
        self.sharedText = text
        self.initLocales()
        self.datesInText = datesSearcher.search(text: sharedText)
        self.measurementInText = unitsSearcher.search(text: sharedText)
    }
    
    mutating func bind(_ binder: @escaping (ViewModelState) -> ()) {
        self.binder = binder
        self.binder?(.idle)
    }
    
    private mutating func initLocales() {
        self.locales.append(Locale(identifier: "ru-RU"))
        self.locales.append(Locale(identifier: "en"))
        self.locales.append(Locale(identifier: "fr"))
        self.locales.append(Locale(identifier: "zh_CN"))
    }
    
    private mutating func loadLocalizedData() {
        let localazator = Localizator(locale: locales[selectedLocaleIndex])
        self.resultItems.removeAll()
        self.resultItems.append(contentsOf:localazator.localizeDates(dates: self.datesInText))
        self.resultItems.append(contentsOf:localazator.localizeUnits(mesaurments: self.measurementInText))
        self.binder?(.result)
    }
}
