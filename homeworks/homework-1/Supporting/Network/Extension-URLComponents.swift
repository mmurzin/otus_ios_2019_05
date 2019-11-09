//
//  Extension-URLComponents.swift
//  homework-1
//
//  Created by michael on 15/09/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
