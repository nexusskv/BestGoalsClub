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
    
    /// ---> Function reset all checkmark buttons <--- ///
    func cleanCheckmarks() {
        let tags: [Int] = [CompaniesSortTypes.asc.rawValue, CompaniesSortTypes.desc.rawValue]
        ButtonStateChanger.shared.cleanCheckmarks(tags, on: self)
    }

    
    /// ---> Function for mark some checkmark button <--- ///
    func addCheckmarks(_ type: CompaniesSortTypes) {
        ButtonStateChanger.shared.addSortCheckmark(self, type: type.rawValue)
    }
}
