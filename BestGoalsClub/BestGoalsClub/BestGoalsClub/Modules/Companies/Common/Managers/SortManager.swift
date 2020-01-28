//
//  SortManager.swift
//  BestGoalsClub
//
//  Created by Rost on 27.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class SortManager {
    
    /// ---> Function for display a view with types of sort  <--- ///
    func displaySortView(_ view: CompaniesViewController) {
        if view.sortView.alpha > 0.0 {
            view.sortView.fadeOut()
        } else {
            view.sortView.fadeIn()
            view.sortView.addCheckmarks(view.sortView.sortType)
        }
    }
    
    
    /// ---> Function for processing a select sort buttons  <--- ///
    func sortActionHandler(_ view: CompaniesViewController, value: Int) {
        if let type = CompaniesSortTypes(rawValue: value) {
            view.sortView.cleanCheckmarks()
            
            view.sortView.addCheckmarks(type)
            
            view.selectedSortType = type
        }
    }
    
    
    /// ---> Function for processing a select ok/close buttons  <--- ///
    func confirmActionHandler(_ view: CompaniesViewController, value: Int) {
        if let type = FinalActionsTypes(rawValue: value) {
            switch type {
                case .close:
                   view.sortView.fadeOut()
                   view.sortView.cleanCheckmarks()
                   view.selectedSortType = .none
                case .ok:
                    switch view.selectedSortType {
                        case .none:
                            AlertPresenter.showAlert(view,
                                                     message: "Please select ascending or descending type for sort companies. \n For hide this dialog just tap by X button.")
                        case .asc, .desc:
                            view.sortView.fadeOut()
                            
                            sortCompanies(view, type: view.selectedSortType)
                    }
                
                    view.sortView.sortType = view.selectedSortType
            }
        }
    }
    
    
    /// ---> Function for processing a sort data by selected type  <--- ///
    func sortCompanies(_ view: CompaniesViewController, type: CompaniesSortTypes) {
        switch type {
            case .asc:
                view.dataArray = view.dataArray.sorted(by: { $0.company < $1.company })
            case .desc:
                view.dataArray = view.dataArray.sorted(by: { $0.company > $1.company })
            default:
                break
        }
        
        view.companiesTable.reloadData()
    }
    
    
    /// ---> Function for restore start data <--- ///
    func restoreAllCompanies(_ view: CompaniesViewController) {
        view.dataArray = view.originalDataArray
        
        if view.selectedSortType != .none {
            sortCompanies(view, type: view.selectedSortType)
        }
        
        view.companiesTable.reloadData()
    }
}
