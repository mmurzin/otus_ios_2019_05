//
//  AvatarComponent.swift
//  homework-1
//
//  Created by michael on 02/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

class AvatarComponent: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    private func configure() {
        let bundle = Bundle.main
        let nib = bundle.loadNibNamed("AvatarComponent", owner: nil, options: nil)
        if let view = nib?[0] as? UIView {
            addSubview(view)
        }
    }

}
