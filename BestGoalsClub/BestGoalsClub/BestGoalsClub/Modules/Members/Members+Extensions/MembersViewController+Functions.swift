//
//  MembersViewController+Functions.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MembersViewController {
    
    func setupUI() {
        membersTable.tableFooterView = UIView()
        
        if let members = DataContainer.shared.allMembers {
            dataArray = members
            membersTable.reloadData()
        }
        
        sortView.alpha = 0.0
    }
    
    func changeMemberParams(_ index: Int) {
        var object = dataArray[index]

        object.isFavorite = !object.isFavorite

        dataArray[index] = object
        
        if let index = originalDataArray.firstIndex(where: { $0.objectId == object.objectId }) {
            originalDataArray[index] = object
        }
        
        membersTable.reloadData()
    }
    
    func sortActionHandler(_ value: Int) {
        if let type = MembersSortTypes(rawValue: value) {
            sortView.cleanCheckmarks()
            
            sortView.addCheckmarks(type)
            
            selectedSortType = type
        }
    }
    
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
                                                     message: "Please select Ascending or Descending type for sort members. Please tap by X button for hide this dialog.")
                        case .ageAsc, .ageDesc, .nameAsc, .nameDesc, .lastNameAsc, .lastNameDesc:
                            sortView.fadeOut()
                            
                            sortMembers(selectedSortType)
                    }
                
                    sortView.sortType = selectedSortType
            }
        }
    }
    
    func sortMembers(_ type: MembersSortTypes) {
        switch type {
            case .ageAsc:
                dataArray = dataArray.sorted(by: { $0.age < $1.age })
            case .ageDesc:
                dataArray = dataArray.sorted(by: { $0.age > $1.age })
            case .nameAsc:
                dataArray = dataArray.sorted(by: { ($0.firstName < $1.firstName ) })
            case .nameDesc:
                dataArray = dataArray.sorted(by: { ($0.firstName > $1.firstName) })
            case .lastNameAsc:
                dataArray = dataArray.sorted(by: { ($0.lastName < $1.lastName ) })
            case .lastNameDesc:
                dataArray = dataArray.sorted(by: { ($0.lastName > $1.lastName) })
            case .none:
                break
        }
        
        membersTable.reloadData()
    }
    
    func restoreAllMembers() {
        dataArray = originalDataArray
        
        if selectedSortType != .none {
            sortMembers(selectedSortType)
        }
        
        membersTable.reloadData()
    }
    
    func displaySortView() {
        if sortView.alpha > 0.0 {
            sortView.fadeOut()
        } else {
            sortView.fadeIn()
            sortView.addCheckmarks(sortView.sortType)
        }
    }
}
