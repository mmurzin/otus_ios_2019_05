//
//  FeedViewModel.swift
//  homework-1
//
//  Created by michael on 12/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

final class FeedViewModel {
    private let suffixArrayManipulator: SuffixArrayManipulator = SwiftSuffixArrayManipulator()
    private var binder:((ViewModelState) -> ())? = nil
    
    var dataItems:[String] = Services.feedProvider.feedData()
    var filteterdDataItems:[String] = []
    
    
    func search(query: String){
        filteterdDataItems = suffixArrayManipulator.searchAlgoName(query: query)
        print("\(filteterdDataItems)")
        self.binder?(.result)
    }
    
    func bind(_ binder: @escaping (ViewModelState) -> ()) {
        self.binder = binder
        dataItems.append(contentsOf: Services.algoProvider.all)
        let _ = suffixArrayManipulator.setupWithObjects(
            items:dataItems, reverse:true)
        self.binder?(.result)
    }
}
