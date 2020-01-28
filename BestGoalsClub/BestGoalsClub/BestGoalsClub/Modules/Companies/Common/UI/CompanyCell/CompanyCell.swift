//
//  CompanyCell.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class CompanyCell: UITableViewCell {
    @IBOutlet weak var logoImageView: AsyncImageView!
    @IBOutlet weak var companyTitle: UILabel!
    @IBOutlet weak var followersNumber: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var favouriteButton: UIButton!
    var viewModel: CompanyCellViewModel!
    
    /// ---> View life cycle <--- ///
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewModel = CompanyCellViewModel()
    }
}

