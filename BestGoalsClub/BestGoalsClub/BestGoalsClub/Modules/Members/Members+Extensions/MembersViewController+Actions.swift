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

    /// ---> Action for favorite button  <--- ///
    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        changeMemberParams(sender.tag)
    }
    
    
    /// ---> Actions for types of sort buttons  <--- ///
    @IBAction func sortMembersButtonTapped(_ sender: UIButton) {
        sortActionHandler(sender.tag)
    }
    
    
    /// ---> Function for ok/close buttons  <--- ///
    @IBAction func confirmActionButtonTapped(_ sender: UIButton) {
        confirmActionHandler(sender.tag)
    }
       
    
    /// ---> Function for sort item in the navigation bar  <--- ///
    @IBAction func showSortView() {
        displaySortView()
    }
}
