//
//  ButtonStateChanger.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class ButtonStateChanger {
    static let shared = ButtonStateChanger()
    private init() { }
    
    func changeFavouriteState(_ button: UIButton, flag: Bool) {
        if !flag {
            button.setBackgroundImage(UIImage(named: "no_favourite_icon"), for: .normal)
        } else {
            button.setBackgroundImage(UIImage(named: "favourite_icon"), for: .normal)
        }
    }
}
