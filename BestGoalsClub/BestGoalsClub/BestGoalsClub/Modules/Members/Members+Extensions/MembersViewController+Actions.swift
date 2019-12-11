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
        changeMemberParams(sender.tag)
    }
    
    @IBAction func sortMembersButtonTapped(_ sender: UIButton) {
        sortActionHandler(sender.tag)
    }
    
    @IBAction func confirmActionButtonTapped(_ sender: UIButton) {
        confirmActionHandler(sender.tag)
    }
       
    @IBAction func showSortView() {
        displaySortView()
    }
}
