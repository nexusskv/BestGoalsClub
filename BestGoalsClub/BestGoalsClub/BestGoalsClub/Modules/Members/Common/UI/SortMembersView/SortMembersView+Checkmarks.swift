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
        let tags: [Int] = [MembersSortTypes.ageAsc.rawValue, MembersSortTypes.ageDesc.rawValue, MembersSortTypes.nameAsc.rawValue, MembersSortTypes.nameDesc.rawValue, MembersSortTypes.lastNameAsc.rawValue, MembersSortTypes.lastNameDesc.rawValue]
                
        ButtonStateChanger.shared.cleanCheckmarks(tags, on: self)
    }
    
    func addCheckmarks(_ type: MembersSortTypes) {
        ButtonStateChanger.shared.addSortCheckmark(self, type: type.rawValue)
    }
}
