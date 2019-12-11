//
//  MembersViewController+Functions.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MembersViewController {
    
    func setupUI() {
        membersTable.tableFooterView = UIView()
        
        if let members = DataContainer.shared.allMembers {
            dataArray = members
            membersTable.reloadData()
        }
    }
}
