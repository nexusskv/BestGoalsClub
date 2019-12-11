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
        ButtonStateChanger.shared.cleanCheckmarks(buttons as! [UIButton])
    }

    
    func addCheckmarks(_ type: CompaniesSortTypes) {
        ButtonStateChanger.shared.addSortCheckmark(self, type: type.rawValue)
    }
}
