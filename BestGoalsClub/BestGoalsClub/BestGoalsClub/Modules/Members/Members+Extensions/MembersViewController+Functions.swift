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
    
    /// ---> Function for UI customisations  <--- ///
    func setupUI() {
        membersTable.tableFooterView = UIView()
        
        if let members = DataContainer.shared.allMembers {
            dataArray           = members
            originalDataArray   = members
            
            membersTable.reloadData()
        }
        
        sortView.alpha = 0.0
    }
    
    
    /// ---> Function for processing a favorite action  <--- ///
    func changeMemberParams(_ index: Int) {
        var object = dataArray[index]

        object.isFavorite = !object.isFavorite

        dataArray[index] = object
        
        if let index = originalDataArray.firstIndex(where: { $0.objectId == object.objectId }) {
            originalDataArray[index] = object
        }
        
        membersTable.reloadData()
    }
    
    
    /// ---> Function for present details view  <--- ///
    func presentDetails(_ index: IndexPath) {
        let selectedMember = dataArray[index.row]
        
        DataContainer.shared.selectedType   = .member
        DataContainer.shared.selectedObject = selectedMember as AnyObject
        
        Router.present("Details", from: self)
    }
    
    
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ table: UITableView, at index: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "MemberCell",
                                             for: index) as? MemberCell
        
        let member: MemberObject = dataArray[index.row]
        
        cell?.setCellValues(member, index: index.row)

        return cell ?? MemberCell()
    }
}
