//
//  CompaniesViewModel.swift
//  BestGoalsClub
//
//  Created by Rost on 27.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class CompaniesViewModel {
    
    /// ---> Function for UI customisations  <--- ///
    func setupUI(_ view: CompaniesViewController) {
        view.companiesTable.tableFooterView = UIView()
        
        view.sortView.alpha = 0.0
    }
    
    
    /// ---> Function for processing a follow/favorite actions  <--- ///
    func changeCompanyParams(_ view: CompaniesViewController, index: Int, type: CompanyObjectTypes) {
        var object = view.dataArray[index]
        switch type {
            case .favourite:
                object.isFavorite = !object.isFavorite
            case .follower:
                if object.followers == 0 {
                    object.followers += 1
                }
        }
        
        view.dataArray[index] = object
        
        if let index = view.originalDataArray.firstIndex(where: { $0.objectId == object.objectId }) {
            view.originalDataArray[index] = object
        }
        
        view.companiesTable.reloadData()
    }
    
    
    /// ---> Function for get all members from each company  <--- ///
    func makeMembersArray(_ view: CompaniesViewController) {
        if view.dataArray.count > 0 {
            let companies = view.dataArray
            
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
    func presentDetails(_ view: CompaniesViewController, index: IndexPath) {
        let selectedCompany = view.dataArray[index.row]
        
        DataContainer.shared.selectedType   = .company
        DataContainer.shared.selectedObject = selectedCompany as AnyObject
        
        Router.present("Details", from: view)
    }
    
    
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ table: UITableView, array: [CompanyObject], index: IndexPath) -> UITableViewCell {
        if let cell = table.dequeueReusableCell(withIdentifier: "CompanyCell",
                                                for: index) as? CompanyCell {
            let company: CompanyObject = array[index.row]
            
            if let model = cell.viewModel {
                model.setCellValues(cell, object: company, index: index.row)
            }
            
            return cell
        }
        
        return CompanyCell()
    }
    
    
    /// ---> Function for processing a received result  <--- ///
    func handleLoadedResult(_ view: CompaniesViewController, result: AnyObject) {
        if result is [CompanyObject] {
            if let companies = result as? [CompanyObject] {
                view.dataArray            = companies
                view.originalDataArray    = companies
                
                view.companiesTable.reloadData()
 
                makeMembersArray(view)
            } else {
                AlertPresenter.showAlert(view, message: "You received empty data.")
            }
        } else if result is String {
            AlertPresenter.showAlert(view, message: result as! String)
        }
    }
}
