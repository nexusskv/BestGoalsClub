//
//  MembersViewController+Actions.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MembersViewController {
    
    
    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        var member = dataArray[sender.tag]
        member.isFavorite = !member.isFavorite
        
        dataArray[sender.tag] = member
        
        membersTable.reloadData()
    }
}
