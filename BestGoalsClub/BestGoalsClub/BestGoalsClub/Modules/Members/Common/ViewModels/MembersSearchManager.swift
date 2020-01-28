//
//  MembersSearchManager.swift
//  BestGoalsClub
//
//  Created by Rost on 28.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class MembersSearchManager {
    
    /// ---> Function for processing a search string  <--- ///
    func handleSearch(_ view: MembersViewController, value: String) {
        if value.count > 0 {
            view.dataArray = view.originalDataArray.filter({ (member) -> Bool in
                let name: NSString = member.firstName as NSString
                let nameRange = name.range(of: value, options: .caseInsensitive)
                
                let lastName: NSString = member.lastName as NSString
                let lastNameRange = lastName.range(of: value, options: .caseInsensitive)
                
                return  nameRange.location != NSNotFound ||
                        lastNameRange.location != NSNotFound
            })
            
            if view.selectedSortType != .none {
                if let manager = view.sortManager {
                    manager.sortMembers(view, type: view.selectedSortType)
                }
            }
        } else {
            if let manager = view.sortManager {
                manager.restoreAllMembers(view)
            }
        }

        view.membersTable.reloadData()
    }
    
    
    /// ---> Function for processing a search cancel button  <--- ///
    func handleSearchCancel(_ view: MembersViewController, bar: UISearchBar) {
        bar.text = nil
        bar.resignFirstResponder()
        
        if let manager = view.sortManager {
            manager.restoreAllMembers(view)
        }
    }
}
