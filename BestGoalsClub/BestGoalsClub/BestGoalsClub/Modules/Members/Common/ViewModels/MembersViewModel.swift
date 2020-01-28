//
//  MembersViewModel.swift
//  BestGoalsClub
//
//  Created by Rost on 28.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class MembersViewModel {
    
    /// ---> Function for UI customisations  <--- ///
    func setupUI(_ view: MembersViewController) {
        view.membersTable.tableFooterView = UIView()
        
        if let members = DataContainer.shared.allMembers {
            view.dataArray           = members
            view.originalDataArray   = members
            
            view.membersTable.reloadData()
        }
        
        view.sortView.alpha = 0.0
    }
    
    
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ table: UITableView, array: [MemberObject], index: IndexPath) -> UITableViewCell {
        if let cell = table.dequeueReusableCell(withIdentifier: "MemberCell",
                                                for: index) as? MemberCell {
        
            let member: MemberObject = array[index.row]
            if let model = cell.viewModel {
                model.setCellValues(cell, object: member, index: index.row)
            }

            return cell
        }
        
        return MemberCell()
    }
    
    
    /// ---> Function for processing a favorite action  <--- ///
    func changeMemberParams(_ view: MembersViewController, index: Int) {
        var object = view.dataArray[index]

        object.isFavorite = !object.isFavorite

        view.dataArray[index] = object
        
        if let index = view.originalDataArray.firstIndex(where: { $0.objectId == object.objectId }) {
            view.originalDataArray[index] = object
        }
        
        view.membersTable.reloadData()
    }
    
    
    /// ---> Function for present details view  <--- ///
    func presentDetails(_ view: MembersViewController, index: IndexPath) {
        let selectedMember = view.dataArray[index.row]
        
        DataContainer.shared.selectedType   = .member
        DataContainer.shared.selectedObject = selectedMember as AnyObject
        
        Router.present("Details", from: view)
    }
}
