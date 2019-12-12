//
//  MembersDetailsCell+UISetter.swift
//  BestGoalsClub
//
//  Created by Rost on 12.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MembersDetailsCell {
    
    /// ---> Function for set values to UI from object <--- ///
    func setCellValues(_ object: MemberObject) {
        memberName.text = object.firstName + " " + object.lastName
        
        memberAge.text = "\(object.age)"
        
        memberEmail.text = object.email
        
        memberPhone.text = object.phone
        
        favImageView.image = UIImage(named: "no_favourite_icon")
        if object.isFavorite {
            favImageView.image = UIImage(named: "favourite_icon")
        }
    }
}
