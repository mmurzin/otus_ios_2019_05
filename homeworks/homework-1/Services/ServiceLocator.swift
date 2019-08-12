//
//  ServiceLocator.swift
//  homework-1
//
//  Created by michael on 12/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

protocol ServiceLocating {
    func getService<T>() -> T?
}

final class ServiceLocator: ServiceLocating {
    public static let shared = ServiceLocator()
    
    private lazy var services: Dictionary<String, Any> = [:]
    
    private func typeName(some: Any) -> String {
        return (some is Any.Type) ?
            "\(some)" : "\(type(of: some))"
    }
    
    func addService<T>(service: T) {
        let key = typeName(some: T.self)
        print("addService \(key)")
        services[key] = service
    }
    
    func getService<T>() -> T? {
        let key = typeName(some: T.self)
        print("getService \(key)")
        return services[key] as? T
    }
}
