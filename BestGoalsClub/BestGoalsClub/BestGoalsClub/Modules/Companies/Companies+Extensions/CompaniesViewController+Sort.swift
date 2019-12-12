//
//  CompaniesViewController+Sort.swift
//  BestGoalsClub
//
//  Created by Rost on 11.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension CompaniesViewController {
    
    /// ---> Function for display a view with types of sort  <--- ///
    func displaySortView() {
        if sortView.alpha > 0.0 {
            sortView.fadeOut()
        } else {
            sortView.fadeIn()
            sortView.addCheckmarks(sortView.sortType)
        }
    }
    
    
    /// ---> Function for processing a select sort buttons  <--- ///
    func sortActionHandler(_ value: Int) {
        if let type = CompaniesSortTypes(rawValue: value) {
            sortView.cleanCheckmarks()
            
            sortView.addCheckmarks(type)
            
            selectedSortType = type
        }
    }
    
    
    /// ---> Function for processing a select ok/close buttons  <--- ///
    func confirmActionHandler(_ value: Int) {
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
                                                     message: "Please select ascending or descending type for sort companies. \n For hide this dialog just tap by X button.")
                        case .asc, .desc:
                            sortView.fadeOut()
                            
                            sortCompanies(selectedSortType)
                    }
                
                    sortView.sortType = selectedSortType
            }
        }
    }
    
    
    /// ---> Function for processing a sort data by selected type  <--- ///
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
    
    
    /// ---> Function for restore start data <--- ///
    func restoreAllCompanies() {
        dataArray = originalDataArray
        
        if selectedSortType != .none {
            sortCompanies(selectedSortType)
        }
        
        companiesTable.reloadData()
    }
}
