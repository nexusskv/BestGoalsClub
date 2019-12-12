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
    
    /// ---> Function for UI customisations  <--- ///
    func setupUI() {
        companiesTable.tableFooterView = UIView()
        
        sortView.alpha = 0.0
    }
    
    
    /// ---> Function for processing a follow/favorite actions  <--- ///
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
    
    
    /// ---> Function for get all members from each company  <--- ///
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
    
    
    /// ---> Function for present details view  <--- ///
    func presentDetails(_ index: IndexPath) {
        let selectedCompany = dataArray[index.row]
        
        DataContainer.shared.selectedType   = .company
        DataContainer.shared.selectedObject = selectedCompany as AnyObject
        
        Router.present("Details", from: self)
    }
    
    
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ table: UITableView, at index: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "CompanyCell",
                                             for: index) as? CompanyCell
        
        let company: CompanyObject = dataArray[index.row]
        cell?.setCellValues(company, index: index.row)
        
        return cell ?? CompanyCell()
    }
    
    
    /// ---> Function for processing a received result  <--- ///
    func handleLoadedResult(_ result: AnyObject) {
        if result is [CompanyObject] {
            if let companies = result as? [CompanyObject] {
                dataArray            = companies
                originalDataArray    = companies
                
                companiesTable.reloadData()
                                    
                makeMembersArray()
            } else {
                AlertPresenter.showAlert(self, message: "You received empty data.")
            }
        } else if result is String {
            AlertPresenter.showAlert(self, message: result as! String)
        }
    }
}
