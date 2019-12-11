//
//  SortMembersView+Checkmarks.swift
//  BestGoalsClub
//
//  Created by Rost on 11.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension SortMembersView {
    
    func cleanCheckmarks() {
        let buttons = [ageAscButton, ageDescButton, nameAscButton, nameDescButton]
        ButtonStateChanger.shared.cleanCheckmarks(buttons as! [UIButton])
    }
    
    func addCheckmarks(_ type: MembersSortTypes) {
        ButtonStateChanger.shared.addSortCheckmark(self, type: type.rawValue)
    }
}
