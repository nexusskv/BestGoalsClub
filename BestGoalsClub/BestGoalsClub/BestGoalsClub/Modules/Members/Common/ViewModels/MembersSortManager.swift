//
//  MembersSortManager.swift
//  BestGoalsClub
//
//  Created by Rost on 28.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class MembersSortManager {
    
    /// ---> Function for display a view with types of sort  <--- ///
    func displaySortView(_ view: MembersViewController) {
        if view.sortView.alpha > 0.0 {
            view.sortView.fadeOut()
        } else {
            view.sortView.fadeIn()
            view.sortView.addCheckmarks(view.sortView.sortType)
        }
    }
    
    
    /// ---> Function for processing a select sort buttons  <--- ///
    func sortActionHandler(_ view: MembersViewController, value: Int) {
        if let type = MembersSortTypes(rawValue: value) {
            view.sortView.cleanCheckmarks()
            
            view.sortView.addCheckmarks(type)
            
            view.selectedSortType = type
        }
    }
    
    
    /// ---> Function for processing a select ok/close buttons  <--- ///
    func confirmActionHandler(_ view: MembersViewController, value: Int) {
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
                                                     message: "Please select some ascending or descending type for sort members. \n For hide this dialog just tap by X button.")
                        case .ageAsc, .ageDesc, .nameAsc, .nameDesc, .lastNameAsc, .lastNameDesc:
                            view.sortView.fadeOut()
                            
                            sortMembers(view, type: view.selectedSortType)
                    }
                
                    view.sortView.sortType = view.selectedSortType
            }
        }
    }
    
    
    /// ---> Function for processing a sort data by selected type  <--- ///
    func sortMembers(_ view: MembersViewController, type: MembersSortTypes) {
        switch type {
            case .ageAsc:
                view.dataArray = view.dataArray.sorted(by: { $0.age < $1.age })
            case .ageDesc:
                view.dataArray = view.dataArray.sorted(by: { $0.age > $1.age })
            case .nameAsc:
                view.dataArray = view.dataArray.sorted(by: { ($0.firstName < $1.firstName ) })
            case .nameDesc:
                view.dataArray = view.dataArray.sorted(by: { ($0.firstName > $1.firstName) })
            case .lastNameAsc:
                view.dataArray = view.dataArray.sorted(by: { ($0.lastName < $1.lastName ) })
            case .lastNameDesc:
                view.dataArray = view.dataArray.sorted(by: { ($0.lastName > $1.lastName) })
            case .none:
                break
        }
        
        view.membersTable.reloadData()
    }
    
    
    /// ---> Function for restore start data <--- ///
    func restoreAllMembers(_ view: MembersViewController) {
        view.dataArray = view.originalDataArray
        
        if view.selectedSortType != .none {
            sortMembers(view, type: view.selectedSortType)
        }
        
        view.membersTable.reloadData()
    }
}
