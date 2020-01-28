//
//  CompaniesViewController.swift
//  BestGoalsClub
//
//  Created by Rost on 09.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import UIKit

class CompaniesViewController: UIViewController {
    @IBOutlet weak var companiesTable: UITableView!
    @IBOutlet weak var sortView: SortCompaniesView!
    var dataArray: [CompanyObject] = []
    var originalDataArray: [CompanyObject] = []
    var selectedSortType: CompaniesSortTypes = .none
    var viewModel: CompaniesViewModel!
    var sortManager: SortManager!
    var searchManager: SearchManager!
    var endpointsManager: EndpointsManager!
    
    /// ---> View life cycle  <--- ///
    override func viewDidLoad() {
        super.viewDidLoad()
                
        viewModel           = CompaniesViewModel()
        sortManager         = SortManager()
        searchManager       = SearchManager()
        endpointsManager    = EndpointsManager()
        
        viewModel.setupUI(self)
        
        endpointsManager.loadCompanies(self)
    }


}

