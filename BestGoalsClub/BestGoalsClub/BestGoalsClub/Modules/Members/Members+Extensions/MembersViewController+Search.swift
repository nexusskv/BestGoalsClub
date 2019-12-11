//
//  MembersViewController+Search.swift
//  BestGoalsClub
//
//  Created by Rost on 11.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MembersViewController: UISearchBarDelegate {

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        
        restoreAllMembers()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 0 {
            dataArray = originalDataArray.filter({ (member) -> Bool in
                let name: NSString = member.firstName as NSString
                let nameRange = name.range(of: searchText, options: .caseInsensitive)
                
                let lastName: NSString = member.lastName as NSString
                let lastNameRange = lastName.range(of: searchText, options: .caseInsensitive)
                
                return  nameRange.location != NSNotFound ||
                        lastNameRange.location != NSNotFound
            })
            
            if selectedSortType != .none {
                sortMembers(selectedSortType)
            }
        } else {
            restoreAllMembers()
        }

        membersTable.reloadData()
    }
}
