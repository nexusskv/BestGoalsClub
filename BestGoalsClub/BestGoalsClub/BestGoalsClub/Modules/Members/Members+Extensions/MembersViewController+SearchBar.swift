//
//  MembersViewController+SearchBar.swift
//  BestGoalsClub
//
//  Created by Rost on 11.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MembersViewController: UISearchBarDelegate {

    /// ---> Search bar delegate functions <--- ///
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchManager.handleSearchCancel(self, bar: searchBar)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchManager.handleSearch(self, value: searchText)
    }
}
