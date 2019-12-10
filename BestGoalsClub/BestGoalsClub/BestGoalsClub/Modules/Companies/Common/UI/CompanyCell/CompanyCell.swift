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
    @IBOutlet weak var favouriteButton: UIButton!
    
    
    func setCellValues(_ sender: CompanyObject) {
        
    }
}
