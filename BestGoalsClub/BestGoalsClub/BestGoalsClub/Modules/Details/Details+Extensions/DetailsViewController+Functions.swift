//
//  DetailsViewController+Functions.swift
//  BestGoalsClub
//
//  Created by Rost on 12.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension DetailsViewController {
    
    func setupUI() {
        detailsTable.tableFooterView = UIView()
    }
    
    func setupDataSource() {
        if DataContainer.shared.selectedType != .none {
            selectedType = DataContainer.shared.selectedType
            
            makeDetailsTitle()
            
            detailsTable.reloadData()
        }
    }
    
    func makeDetailsTitle() {
        switch selectedType {
            case .company:
                navigationBar.topItem!.title = "Company Details"
            case .member:
                navigationBar.topItem!.title = "Member Details"
            case .none:
                break
        }
    }
}
