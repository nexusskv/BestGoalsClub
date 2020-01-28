//
//  CompaniesDetailsCell.swift
//  BestGoalsClub
//
//  Created by Rost on 12.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class CompaniesDetailsCell: UITableViewCell {
    @IBOutlet weak var companyLogo: AsyncImageView!
    @IBOutlet weak var companyTitle: UILabel!
    @IBOutlet weak var companyWeb: UILabel!
    @IBOutlet weak var companyFollowers: UILabel!
    @IBOutlet weak var favImageView: UIImageView!
    var viewModel: CompaniesDetailsCellViewModel!
    
    /// ---> Cell life cycle <--- ///
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewModel = CompaniesDetailsCellViewModel()
        
        setupUI()
    }
    
    
    /// ---> UI customisations <--- ///
    private func setupUI() {
        let radius = companyLogo.bounds.size.width / 2.0
        self.companyLogo.roundCorners(radius, border: 1.5, color: .lightGray)
    }
}
