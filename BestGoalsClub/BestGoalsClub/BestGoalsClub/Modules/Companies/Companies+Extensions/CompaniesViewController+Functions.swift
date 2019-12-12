//
//  CompaniesViewController+Functions.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension CompaniesViewController {
    
    func setupUI() {
        companiesTable.tableFooterView = UIView()
        
        sortView.alpha = 0.0
    }
    
    func changeCompanyParams(_ index: Int, by type: CompanyObjectTypes) {
        var object = dataArray[index]
        switch type {
            case .favourite:
                object.isFavorite = !object.isFavorite
            case .follower:
                if object.followers == 0 {
                    object.followers += 1
                }
        }
        
        dataArray[index] = object
        
        if let index = originalDataArray.firstIndex(where: { $0.objectId == object.objectId }) {
            originalDataArray[index] = object
        }
        
        companiesTable.reloadData()
    }
    
    func makeMembersArray() {
        if dataArray.count > 0 {
            let companies = dataArray
            
            DispatchQueue.global(qos: .userInitiated).async {
                var membersArray = [MemberObject]()
                
                for company in companies {
                    membersArray += company.members
                }
                
                DataContainer.shared.allMembers = membersArray
            }
        }
    }
    
    func presentDetails(_ index: IndexPath) {
        let selectedCompany = dataArray[index.row]
        
        DataContainer.shared.selectedType   = .company
        DataContainer.shared.selectedObject = selectedCompany as AnyObject
        
        Router.present("Details", from: self)
    }
}
