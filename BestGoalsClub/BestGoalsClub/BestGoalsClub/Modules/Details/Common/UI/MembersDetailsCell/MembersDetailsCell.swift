//
//  MembersDetailsCell.swift
//  BestGoalsClub
//
//  Created by Rost on 12.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class MembersDetailsCell: UITableViewCell {
    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var memberAge: UILabel!
    @IBOutlet weak var memberEmail: UILabel!
    @IBOutlet weak var memberPhone: UILabel!
    @IBOutlet weak var favImageView: UIImageView!
    

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
