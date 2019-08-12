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
    
    var dataItems:[String] = []
    var filteterdDataItems:[String] = []
    
    init(provider:AlgorithmsProvider?) {
        if provider != nil {
            let items = provider?.getAlgorithmsList() ?? [String]()
            dataItems.append(contentsOf: items)
            let _ = suffixArrayManipulator.setupWithObjects(
                items:dataItems, reverse:true)
        } else {
            print("AlgorithmsProvider is nil")
            dataItems = [String]()
        }
    }
    
    func search(query: String){
        filteterdDataItems = suffixArrayManipulator.searchAlgoName(query: query)
        self.binder?(.result)
    }
    
    func bind(_ binder: @escaping (ViewModelState) -> ()) {
        self.binder = binder
        self.binder?(.result)
    }
}
