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
    
    
    func loadCompanies() {
        GetListData.loadList(dataUrl, completion: { [weak self] result in
            guard let strongSelf = self else {
              return
            }
            
            if result is [CompanyObject] {
                if let companies = result as? [CompanyObject] {
                    strongSelf.dataArray = companies
                    strongSelf.companiesTable.reloadData()
                                        
                    strongSelf.makeMembersArray()
                } else {
                    AlertPresenter.showAlert(strongSelf, message: "You received empty array of data.")
                }
            } else if result is String {
                AlertPresenter.showAlert(strongSelf, message: result as! String)
            }
        })        
    }
}
