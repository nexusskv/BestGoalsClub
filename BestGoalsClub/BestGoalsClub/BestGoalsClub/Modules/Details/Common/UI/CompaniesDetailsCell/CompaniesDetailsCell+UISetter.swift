//
//  CompaniesDetailsCell+UISetter.swift
//  BestGoalsClub
//
//  Created by Rost on 12.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension CompaniesDetailsCell {
    
    /// ---> Function for set values to UI from object <--- ///
    func setCellValues(_ object: CompanyObject) {
        companyLogo.loadAsync(object.logo, placeholder: UIImage(named: "logo_holder"))
        
        companyTitle.text = object.company
        
        companyWeb.text = object.website

        companyFollowers.text = "\(object.followers)"
        
        favImageView.image = UIImage(named: "no_favourite_icon")
        if object.isFavorite {
            favImageView.image = UIImage(named: "favourite_icon")
        }
    }
}
