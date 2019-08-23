//
//  DataStructuresViewModel.swift
//  homework-1
//
//  Created by michael on 08/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

class DataStructuresViewModel {
    
    let sizesForTest = [100, 1000, 10000, 100000, 1000000, 10000000]
    
    var numberOfItems: Int = 1000 //Default to 1000
    var itemsCount = 9
    
    lazy var numberFormatter: NumberFormatter = {
        var formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        return formatter
    }()
    
    lazy var timeNumberFormatter: NumberFormatter = {
        var formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        let digits = 6
        formatter.minimumFractionDigits = digits
        formatter.maximumFractionDigits = digits
        return formatter
    }()
    
    private var binder:((ViewModelState) -> ())? = nil
    
    func create() {
        
    }
    
    func test() {
        print("Override this method")
    }
    
    func bind(_ binder: @escaping (ViewModelState) -> ()) {
        self.binder = binder
    }
    
    func createAndTest() {
        self.binder?(.loading)
        DispatchQueue.global(qos: .background).async {
            self.create()
            self.test()
            DispatchQueue.main.async {
                self.binder?(.result)
            }
        }
    }
    
    func testOnly() {
        self.binder?(.loading)
        DispatchQueue.global(qos: .background).async {
            self.test()
            DispatchQueue.main.async {
                self.binder?(.result)
            }
        }
    }
}
