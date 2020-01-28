//
//  SearchManager.swift
//  BestGoalsClub
//
//  Created by Rost on 27.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class SearchManager {
    
    /// ---> Function for processing a search string  <--- ///
    func handleSearch(_ view: CompaniesViewController, value: String) {
        if value.count > 0 {
            view.dataArray = view.originalDataArray.filter({ (company) -> Bool in
                let name: NSString = company.company as NSString
                let range = name.range(of: value, options: .caseInsensitive)
                
                return range.location != NSNotFound
            })
            
            if view.selectedSortType != .none {
                if let manager = view.sortManager {
                    manager.sortCompanies(view, type: view.selectedSortType)
                }
            }
        } else {
            if let manager = view.sortManager {
                manager.restoreAllCompanies(view)
            }
        }

        view.companiesTable.reloadData()
    }
    
    
    /// ---> Function for processing a search cancel button  <--- ///
    func handleSearchCancel(_ view: CompaniesViewController, bar: UISearchBar) {
        bar.text = nil
        bar.resignFirstResponder()
        
        if let manager = view.sortManager {
            manager.restoreAllCompanies(view)
        }
    }
}
