//
//  DetailsViewController.swift
//  BestGoalsClub
//
//  Created by Rost on 12.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class DetailsViewController: UIViewController {
    @IBOutlet weak var detailsTable: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    var selectedType: DetailsTypes = .none
    var viewModel: DetailsViewModel!

    /// ---> View life cycle <--- ///
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = DetailsViewModel()
        
        viewModel.setupUI(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.setupDataSource(self)
    }
}
