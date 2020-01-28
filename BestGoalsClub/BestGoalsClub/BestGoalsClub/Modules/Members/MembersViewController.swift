//
//  MembersViewController.swift
//  BestGoalsClub
//
//  Created by Rost on 09.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import UIKit


class MembersViewController: UIViewController {
    @IBOutlet weak var membersTable: UITableView!
    @IBOutlet weak var sortView: SortMembersView!
    var dataArray: [MemberObject] = []
    var originalDataArray: [MemberObject] = []
    var selectedSortType: MembersSortTypes = .none
    var viewModel: MembersViewModel!
    var sortManager: MembersSortManager!
    var searchManager: MembersSearchManager!
    
    /// ---> View life cycle  <--- ///
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel       = MembersViewModel()
        sortManager     = MembersSortManager()
        searchManager   = MembersSearchManager()
        
        viewModel.setupUI(self)
    }
}

