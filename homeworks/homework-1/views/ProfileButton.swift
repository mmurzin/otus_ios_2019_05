//
//  LoginButton.swift
//  homework-1
//
//  Created by michael on 02/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

@IBDesignable class ProfileButton: UIButton {
    
    static let typeLogin = "login"
    static let typeLogout = "logout"
    
    @IBInspectable var buttonBackgroundColor: UIColor = .cyan {
        didSet {
            backgroundColor = buttonBackgroundColor
        }
    }
    
    @IBInspectable var buttonCornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = buttonCornerRadius
        }
    }
    
    @IBInspectable var buttonTextColor: UIColor = .white {
        didSet {
            setTitleColor(buttonTextColor, for: .normal)
        }
    }
    
    @IBInspectable var type: String = ProfileButton.typeLogin {
        didSet{
            if self.type == ProfileButton.typeLogin {
                buttonBackgroundColor = .green
                buttonTextColor = .orange
                setTitle("Login", for: .normal)
            } else if self.type == ProfileButton.typeLogout {
                buttonBackgroundColor = .red
                buttonTextColor = .blue
                setTitle("Logout", for: .normal)
            }
        }
    }
}
