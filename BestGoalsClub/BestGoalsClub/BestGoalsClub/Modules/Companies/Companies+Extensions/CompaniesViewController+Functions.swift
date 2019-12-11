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
        var company = dataArray[index]
        switch type {
            case .favourite:
                company.isFavorite = !company.isFavorite
            case .follower:
                company.followers += 1
        }
        
        dataArray[index] = company
        
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
    
    func sortActionHandler(_ value: Int) {
        if let type = CompaniesSortTypes(rawValue: value) {
            sortView.cleanCheckmarks()
            
            sortView.addCheckmarks(type)
            
            selectedSortType = type
        }
    }
    
    func finalActionHandler(_ value: Int) {
        if let type = FinalActionsTypes(rawValue: value) {
            switch type {
                case .close:
                   sortView.fadeOut()
                   sortView.cleanCheckmarks()
                   selectedSortType = .none
                case .ok:
                    switch selectedSortType {
                        case .none:
                            AlertPresenter.showAlert(self,
                                                     message: "Please select Ascending or Descending type for sort companies. Please tap by X button for hide this dialog.")
                        case .asc, .desc:
                            sortView.fadeOut()
                            
                            sortCompanies(selectedSortType)
                    }
                
                    sortView.sortType = selectedSortType
            }
        }
    }
    
    func sortCompanies(_ type: CompaniesSortTypes) {
        switch type {
            case .asc:
                dataArray = dataArray.sorted(by: { $0.company < $1.company })
            case .desc:
                dataArray = dataArray.sorted(by: { $0.company > $1.company })
            default:
                break
        }
        
        companiesTable.reloadData()
    }
}
