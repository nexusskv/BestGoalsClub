//
//  DetailsViewController+Table.swift
//  BestGoalsClub
//
//  Created by Rost on 12.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {
        
    /// ---> Table view data source and delegate methods <--- ///
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewModel.makeCell(self, table: tableView, at: indexPath)

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.makeRowsCount(self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.makeCellHeight(self, index: indexPath)
    }

}


