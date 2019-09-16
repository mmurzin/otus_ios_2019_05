//
//  AlgorithmRepository.swift
//  homework-1
//
//  Created by michael on 31/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation
import RealmSwift

struct AlgorithmRepository {
    let provider: AlgorithmItemsProvider
    let realm = try? Realm()
    
    init(provider: AlgorithmItemsProvider) {
        self.provider = provider
    }
    
    func getItems(completion: @escaping ([AlgorithmItem])->()) {
        DispatchQueue.main.async {
            let result = self.realm?.objects(AlgorithmItem.self)
            if (result?.count ?? 0) > 0 {
                let items = Array(result!)
                if items.count > 0 {
                    completion(items)
                } else {
                    print("Realm cache error")
                    completion([])
                }
            } else {
                self.provider.getRemoteAlgorithmItems({ (items: [AlgorithmItem]) in
                    completion(items)
                    self.cacheData(values: items)
                })
            }
        }
    }
    
    private func cacheData(values:[AlgorithmItem]){
        DispatchQueue.main.async {
            do {
                let result = self.realm?.objects(AlgorithmItem.self)
                guard (result != nil) else { return }
                self.realm?.beginWrite()
                self.realm?.delete(result!)
                self.realm?.add(values)
                try self.realm?.commitWrite()
                print(self.realm?.configuration.fileURL?.absoluteURL as Any)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    func updateItems(_ changes: [AlgorithmItem: String]){
        for (item, color) in changes {
            try? realm?.write {
                item.cellBackground = color
            }
        }
    }
    
    
}
