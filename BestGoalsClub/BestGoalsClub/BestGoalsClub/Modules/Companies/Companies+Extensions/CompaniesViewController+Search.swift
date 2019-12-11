//
//  CompaniesViewController+Search.swift
//  BestGoalsClub
//
//  Created by Rost on 11.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension CompaniesViewController: UISearchBarDelegate {

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        
        restoreAllCompanies()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()        
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 0 {
            dataArray = originalDataArray.filter({ (company) -> Bool in
                let name: NSString = company.company as NSString
                let range = name.range(of: searchText, options: .caseInsensitive)
                
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
}
