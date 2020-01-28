//
//  MembersDetailsCellViewModel.swift
//  BestGoalsClub
//
//  Created by Rost on 28.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class MembersDetailsCellViewModel {
    
    /// ---> Function for set values to UI from object <--- ///
    func setCellValues(_ cell: MembersDetailsCell, object: MemberObject) {
        cell.memberName.text = object.firstName + " " + object.lastName
        
        cell.memberAge.text = "\(object.age)"
        
        cell.memberEmail.text = object.email
        
        cell.memberPhone.text = object.phone
        
        cell.favImageView.image = UIImage(named: "no_favourite_icon")
        if object.isFavorite {
            cell.favImageView.image = UIImage(named: "favourite_icon")
        }
    }
}
