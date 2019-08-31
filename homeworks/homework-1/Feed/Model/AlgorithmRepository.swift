//
//  AlgorithmRepository.swift
//  homework-1
//
//  Created by michael on 31/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

struct AlgorithmRepository {
    let storage: AlgorithmsStorage
    let provider: AlgorithmItemsProvider
    
    init(storage: AlgorithmsStorage, provider: AlgorithmItemsProvider) {
        self.storage = storage
        self.provider = provider
    }
    
    func getItems(completion: ([AlgorithmItem])->()) {
        if storage.isCacheExist() {
            storage.getCachedData(completion)
        } else {
            provider.getRemoteAlgorithmItems{ items in
                storage.cacheData(items)
                completion(items)
            }
        }
    }
    
    func cacheData(_ items:[AlgorithmItem]){
        storage.cacheData(items)
    }
    
}
