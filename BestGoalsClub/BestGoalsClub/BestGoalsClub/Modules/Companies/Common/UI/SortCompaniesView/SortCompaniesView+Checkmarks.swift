//
//  SortCompaniesView+Checkmarks.swift
//  BestGoalsClub
//
//  Created by Rost on 11.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension SortCompaniesView {
    
    func cleanCheckmarks() {
        let buttons = [ascButton, descButton]
        for button in buttons {
            button?.setBackgroundImage(UIImage(named: "no_checkmark_icon"), for: .normal)
        }
    }
    
    func addCheckmarks(_ type: CompaniesSortTypes) {
        switch type {
            case .asc:
                ascButton.setBackgroundImage(UIImage(named: "checkmark_icon"), for: .normal)
            case .desc:
                descButton.setBackgroundImage(UIImage(named: "checkmark_icon"), for: .normal)
            case .none:
                break
        }
    }
}
