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
    
    
    /// ---> Setter for values in UI <--- ///
    func setCellValues(_ object: CompanyObject, index: Int) {
        let holderImage = UIImage(named: "logo_holder")
        
        if !object.logo.isEmpty {
            logoImageView.loadAsync(object.logo, placeholder: holderImage)
        } else {
            logoImageView.image = holderImage
        }
        
        logoImageView.roundCorners(logoImageView.frame.size.width / 2.0)
        
        if !object.company.isEmpty {
            companyTitle.text = object.company
        }
        
        ButtonStateChanger.shared.changeFavouriteState(favouriteButton,
                                                       flag: object.isFavorite)

        followersNumber.text = "\(object.followers)"

        
        followButton.roundCorners(10, border: 1, color: .lightGray)
        followButton.tag    = index
        favouriteButton.tag = index
    }
}

