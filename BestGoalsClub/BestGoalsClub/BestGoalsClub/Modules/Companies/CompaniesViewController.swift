//
//  CompaniesViewController.swift
//  BestGoalsClub
//
//  Created by Rost on 09.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import UIKit

class CompaniesViewController: UIViewController {
    var dataArray: [CompanyObject]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetListData.loadList(dataUrl, completion: { [weak self] result in
            guard let strongSelf = self else {
              return
            }
            
            if result is [[String: Any]] {
                strongSelf.dataArray = result as? [CompanyObject]
            } else {
                // add show alert here
            }
        })
    }


}

