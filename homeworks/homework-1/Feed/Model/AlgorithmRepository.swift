//
//  AlgorithmRepository.swift
//  homework-1
//
//  Created by michael on 31/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation
import RxSwift

struct AlgorithmRepository {
    let storage: AlgorithmsStorage
    let provider: AlgorithmItemsProvider
    
    init(storage: AlgorithmsStorage, provider: AlgorithmItemsProvider) {
        self.storage = storage
        self.provider = provider
    }
    
    func getItems() -> Single<[AlgorithmItem]> {
        if storage.isCacheExist() {
            return storage.getCachedData()
        } else {
            return
                provider
                    .getRemoteAlgorithmItems()
                    .flatMap({ items -> Single<[AlgorithmItem]> in
                        return self.cacheData(items)
                    })
        }
    }
    
    func cacheData(_ items:[AlgorithmItem]) -> Single<[AlgorithmItem]>{
        storage.cacheData(items)
        return Single<[AlgorithmItem]>.create { single in
            single(.success(items))
            return Disposables.create {}
        }
    }
    
}
