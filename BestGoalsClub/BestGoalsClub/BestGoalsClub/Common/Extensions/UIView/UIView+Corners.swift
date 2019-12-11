//
//  UIView+Corners.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
        
    /// ---> Function for simple round corners  <--- ///
    func roundCorners(_ radius: CGFloat) {
        roundCorners(radius, border: nil, color: nil)
    }
    
    
    /// ---> Function for round corners and change params of border  <--- ///
    func roundCorners(_ radius: CGFloat, border: CGFloat?, color: UIColor?) {
        layer.cornerRadius  = radius
        clipsToBounds       = true
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        if let value = border {
            layer.borderWidth   = value
        }
        
        if let value = color {
            layer.borderColor   = value.cgColor
        }
    }
}
