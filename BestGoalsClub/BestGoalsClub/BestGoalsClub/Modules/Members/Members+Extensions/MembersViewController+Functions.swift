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
            dataArray           = members
            originalDataArray   = members
            
            membersTable.reloadData()
        }
        
        sortView.alpha = 0.0
    }
    
    func changeMemberParams(_ index: Int) {
        var object = dataArray[index]

        object.isFavorite = !object.isFavorite

        dataArray[index] = object
        
        if let index = originalDataArray.firstIndex(where: { $0.objectId == object.objectId }) {
            originalDataArray[index] = object
        }
        
        membersTable.reloadData()
    }
}
