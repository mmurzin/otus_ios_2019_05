//
//  CGRect.swift
//  homework-1
//
//  Created by michael on 30/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

extension CGRect {
    init(centeredOn center: CGPoint, size: CGSize) {
        self.init(
            origin: CGPoint(
                x: center.x - size.width * 0.5, y: center.y - size.height * 0.5
            ),
            size: size
        )
    }
    var center: CGPoint {
        return CGPoint(x: width / 2 + origin.x,
                       y: height / 2 + origin.y)
    }
}
