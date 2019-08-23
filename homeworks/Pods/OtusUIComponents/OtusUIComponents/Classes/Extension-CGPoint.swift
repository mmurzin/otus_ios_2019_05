//
//  CGPoint.swift
//  homework-1
//
//  Created by michael on 30/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//
import UIKit

extension CGPoint {
    init(center: CGPoint, radius: CGFloat, degrees: CGFloat) {
        self.init(x: cos(degrees) * radius + center.x,
                  y: sin(degrees) * radius + center.y)
    }
    
    func projected(by value: CGFloat, angle: CGFloat) -> CGPoint {
        return CGPoint(
            x: x + value * cos(angle), y: y + value * sin(angle)
        )
    }
}
