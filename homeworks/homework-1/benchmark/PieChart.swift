//
//  PieChart.swift
//  homework-1
//
//  Created by michael on 26/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

struct Segment {
    let color: UIColor
    let value: CGFloat
    let label: String
    let labelColor: UIColor
}

class PieChart: UIView {
    
    var segments: [Segment] = []{
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        guard let contex = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let radius = min(frame.width, frame.height) * 0.5
        let viewCenter = bounds.center
        let textPositionOffset:CGFloat = 0.6
        let totalSegmantsValue = segments.reduce(0, {$0 + $1.value})
        var startAngle = -CGFloat.pi * 0.5
        
        for segment in segments {
            contex.setFillColor(segment.color.cgColor)
            
            let endAngle = startAngle + 2 * .pi * (segment.value/totalSegmantsValue)
            contex.move(to: viewCenter)
            contex.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            contex.fillPath()
            
            let halfAngle = startAngle + (endAngle - startAngle)/2
            let segmentCenter = viewCenter.projected(by: radius * textPositionOffset, angle: halfAngle)
            let textToRender = segment.label as NSString
            let labelAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 10),
                .foregroundColor: segment.labelColor
            ]
            let renderRect = CGRect(centeredOn: segmentCenter, size: textToRender.size(withAttributes: labelAttributes))
            textToRender.draw(in: renderRect, withAttributes: labelAttributes)
            
            startAngle = endAngle
        }
    }
    
    func setSize(width: CGFloat, height: CGFloat) {
        heightConstraint?.constant = height
        widthConstraint?.constant = width
    }
}

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

extension UIView {
    
    var heightConstraint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .height && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
    var widthConstraint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .width && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
}
