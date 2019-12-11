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
    
    @IBAction func followButtonTapped(_ sender: UIButton) {
        changeCompanyParams(sender.tag, by: .follower)
    }
    
    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        changeCompanyParams(sender.tag, by: .favourite)
    }
    
    @IBAction func sortCompaniesButtonTapped(_ sender: UIButton) {
        sortActionHandler(sender.tag)
    }
    
    @IBAction func finalActionButtonTapped(_ sender: UIButton) {
        finalActionHandler(sender.tag)
    }
       
    @IBAction func showSortView() {
        if sortView.alpha > 0.0 {
            sortView.fadeOut()
        } else {
            sortView.fadeIn()
            sortView.addCheckmarks(sortView.sortType)
            
        }
    }
}
