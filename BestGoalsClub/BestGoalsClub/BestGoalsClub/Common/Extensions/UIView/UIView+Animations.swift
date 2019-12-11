//
//  UIView+Animations.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension UIView {

    func fadeIn(_ duration: TimeInterval = 0.8, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        self.alpha = 0.1
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: nil)
    }
    
    func fadeOut(_ duration: TimeInterval = 0.8, delay: TimeInterval = 0.1, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
            self.alpha = 0.1
        }, completion: { result in
            self.alpha = 0.0
        })
    }

}
