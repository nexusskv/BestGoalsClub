//
//  CompaniesViewController+Endpoints.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension CompaniesViewController {
    
    /// ---> Function for download data source from server API <--- ///
    func loadCompanies() {
        GetListData.loadList(dataUrl, completion: { [weak self] result in
            guard let strongSelf = self else {
              return
            }
            
            strongSelf.handleLoadedResult(result)
        })        
    }
}
