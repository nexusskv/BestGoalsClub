//
//  CompaniesViewController+SearchHandlers.swift
//  BestGoalsClub
//
//  Created by Rost on 12.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension CompaniesViewController {
    
    /// ---> Function for processing a search string  <--- ///
    func handleSearch(_ value: String) {
        if value.count > 0 {
            dataArray = originalDataArray.filter({ (company) -> Bool in
                let name: NSString = company.company as NSString
                let range = name.range(of: value, options: .caseInsensitive)
                
                return range.location != NSNotFound
            })
            
            if selectedSortType != .none {
                sortCompanies(selectedSortType)
            }
        } else {
            restoreAllCompanies()
        }

        companiesTable.reloadData()
    }
    
    
    /// ---> Function for processing a search cancel button  <--- ///
    func handleSearchCancel(_ bar: UISearchBar) {
        bar.text = nil
        bar.resignFirstResponder()
        
        restoreAllCompanies()
    }
}
