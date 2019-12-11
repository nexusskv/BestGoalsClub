//
//  CompaniesViewController.swift
//  BestGoalsClub
//
//  Created by Rost on 09.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import UIKit

class CompaniesViewController: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var companiesTable: UITableView!
    @IBOutlet weak var sortView: SortCompaniesView!
    var dataArray: [CompanyObject] = []
    var selectedSortType: CompaniesSortTypes = .none
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        loadCompanies()
    }


}

