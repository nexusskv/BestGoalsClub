//
//  CompanyCellViewModel.swift
//  BestGoalsClub
//
//  Created by Rost on 27.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class CompanyCellViewModel {
    
    /// ---> Setter for values on UI <--- ///
    func setCellValues(_ cell: CompanyCell, object: CompanyObject, index: Int) {
        let holderImage = UIImage(named: "logo_holder")
        
        if !object.logo.isEmpty {
            cell.logoImageView.loadAsync(object.logo, placeholder: holderImage)
        } else {
            cell.logoImageView.image = holderImage
        }
        
        cell.logoImageView.roundCorners(cell.logoImageView.frame.size.width / 2.0)
        
        if !object.company.isEmpty {
            cell.companyTitle.text = object.company
        }
        
        ButtonStateChanger.shared.changeFavouriteState(cell.favouriteButton,
                                                       flag: object.isFavorite)

        cell.followersNumber.text = "\(object.followers)"

        
        cell.followButton.roundCorners(10, border: 1, color: .lightGray)
        cell.followButton.tag    = index
        cell.favouriteButton.tag = index
    }
}
