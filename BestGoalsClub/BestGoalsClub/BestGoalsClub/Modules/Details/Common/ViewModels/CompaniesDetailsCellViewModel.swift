//
//  CompaniesDetailsCellViewModel.swift
//  BestGoalsClub
//
//  Created by Rost on 28.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class CompaniesDetailsCellViewModel {
    
    /// ---> Function for set values to UI from object <--- ///
    func setCellValues(_ cell: CompaniesDetailsCell, object: CompanyObject) {
        cell.companyLogo.loadAsync(object.logo, placeholder: UIImage(named: "logo_holder"))
        
        cell.companyTitle.text = object.company
        
        cell.companyWeb.text = object.website

        cell.companyFollowers.text = "\(object.followers)"
        
        cell.favImageView.image = UIImage(named: "no_favourite_icon")
        if object.isFavorite {
            cell.favImageView.image = UIImage(named: "favourite_icon")
        }
    }
}
