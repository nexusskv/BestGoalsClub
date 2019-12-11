//
//  MemberCell.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class MemberCell: UITableViewCell {
    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var memberAge: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    
    func setCellValues(_ object: MemberObject, index: Int) {
        if !object.firstName.isEmpty && !object.lastName.isEmpty  {
            memberName.text = object.firstName + " " + object.lastName
        } else if object.firstName.isEmpty {
            memberName.text = object.lastName
        } else {
            memberName.text = object.firstName
        }
                
        if object.age > 0 {
            memberAge.text = "\(object.age)"
        }
        
        ButtonStateChanger.shared.changeFavouriteState(favouriteButton,
                                                       flag: object.isFavorite)
        favouriteButton.tag = index
    }
}
