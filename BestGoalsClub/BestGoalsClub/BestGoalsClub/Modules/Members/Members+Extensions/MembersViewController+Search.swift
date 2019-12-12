//
//  MembersViewController+Search.swift
//  BestGoalsClub
//
//  Created by Rost on 12.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MembersViewController {
    
    /// ---> Function for processing a search string  <--- ///
    func handleSearch(_ value: String) {
        if value.count > 0 {
            dataArray = originalDataArray.filter({ (member) -> Bool in
                let name: NSString = member.firstName as NSString
                let nameRange = name.range(of: value, options: .caseInsensitive)
                
                let lastName: NSString = member.lastName as NSString
                let lastNameRange = lastName.range(of: value, options: .caseInsensitive)
                
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
    
    
    /// ---> Function for processing a search cancel button  <--- ///
    func handleSearchCancel(_ bar: UISearchBar) {
        bar.text = nil
        bar.resignFirstResponder()
        
        restoreAllMembers()
    }
}
