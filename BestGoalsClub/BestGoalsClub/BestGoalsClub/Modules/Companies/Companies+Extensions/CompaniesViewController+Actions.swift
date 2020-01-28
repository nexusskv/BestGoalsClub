//
//  CompaniesViewController+Actions.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension CompaniesViewController {
    
    /// ---> Action for follow button  <--- ///
    @IBAction func followButtonTapped(_ sender: UIButton) {
        viewModel.changeCompanyParams(self, index: sender.tag, type: .follower)
    }
    
    
    /// ---> Action for favorite button  <--- ///
    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        viewModel.changeCompanyParams(self, index: sender.tag, type: .favourite)
    }
    
    
    /// ---> Actions for types of sort buttons  <--- ///
    @IBAction func sortCompaniesButtonTapped(_ sender: UIButton) {
        sortManager.sortActionHandler(self, value: sender.tag)
    }
    
    
    /// ---> Function for ok/close buttons  <--- ///
    @IBAction func confirmActionButtonTapped(_ sender: UIButton) {
        sortManager.confirmActionHandler(self, value: sender.tag)
    }
    
    
    /// ---> Function for sort item in the navigation bar  <--- ///
    @IBAction func showSortView() {
        sortManager.displaySortView(self)
    }
}
