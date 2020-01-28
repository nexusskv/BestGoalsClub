//
//  DetailsViewModel.swift
//  BestGoalsClub
//
//  Created by Rost on 28.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class DetailsViewModel {
    
    /// ---> Function for UI customisations <--- ///
    func setupUI(_ view: DetailsViewController) {
        view.detailsTable.tableFooterView = UIView()
    }
    
    
    /// ---> Function for set data source <--- ///
    func setupDataSource(_ view: DetailsViewController) {
        if DataContainer.shared.selectedType != .none {
            view.selectedType = DataContainer.shared.selectedType
            
            makeDetailsTitle(view)
            
            view.detailsTable.reloadData()
        }
    }
    
    
    /// ---> Function make title of view controller <--- ///
    func makeDetailsTitle(_ view: DetailsViewController) {
        switch view.selectedType {
            case .company:
                view.navigationBar.topItem!.title = "Company Details"
            case .member:
                view.navigationBar.topItem!.title = "Member Details"
            case .none:
                break
        }
    }
    
    
    /// ---> Function for make custom heights of cells based on index of row <--- ///
    func makeCellHeight(_ view: DetailsViewController, index: IndexPath) -> CGFloat {
        switch view.selectedType {
            case .member:
                return 204.0
            
            case .company:
                if let type = DetailsCompanyRows(rawValue: index.row) {
                    switch type {
                        case .general:
                            return 193.0
                        case .members, .about:
                            return 182.0
                    }
                }
            
            case .none:
                return 0.0
        }
        
        return 0.0
    }
    
    
    /// ---> Function make counts based on selected type of object <--- ///
    func makeRowsCount(_ view: DetailsViewController) -> Int {
        switch view.selectedType {
            case .member:
                return 1
            case .company:
                return 3
            case .none:
                return 0
        }
    }
        
    
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ view: DetailsViewController, table: UITableView, at index: IndexPath) -> UITableViewCell {
        switch view.selectedType {
            case .member:
                if let cell = table.dequeueReusableCell(withIdentifier: "MembersDetailsCell", for: index) as? MembersDetailsCell {
                    
                    if let object = DataContainer.shared.selectedObject as? MemberObject, let model = cell.viewModel {
                        model.setCellValues(cell, object: object)
                    }
                    
                    return cell
                }
                
                return MembersDetailsCell()
            case .company:
                if let type = DetailsCompanyRows(rawValue: index.row) {
                    switch type {
                        case .general:
                            if let cell = table.dequeueReusableCell(withIdentifier: "CompaniesDetailsCell", for: index) as? CompaniesDetailsCell {
                            
                                if let object = DataContainer.shared.selectedObject as? CompanyObject, let model = cell.viewModel {
                                    model.setCellValues(cell, object: object)
                                }

                                return cell
                            }
                            
                            return CompaniesDetailsCell()
                        case .members, .about:
                            if let cell = table.dequeueReusableCell(withIdentifier: "InfoCell", for: index) as? InfoCell {
                            
                                if let object = DataContainer.shared.selectedObject as? CompanyObject, let model = cell.viewModel {
                                    model.setCellValues(cell, object: object, type: type)
                                }

                                return cell
                            }
                            
                            return InfoCell()
                    }
                }

            case .none:
                return UITableViewCell()
        }
        
        return UITableViewCell()
    }
}
