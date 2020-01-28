//
//  MemberCellViewModel.swift
//  BestGoalsClub
//
//  Created by Rost on 28.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class MemberCellViewModel {
    
    /// ---> Function for set values to UI from object <--- ///
    func setCellValues(_ cell: MemberCell, object: MemberObject, index: Int) {
           if !object.firstName.isEmpty && !object.lastName.isEmpty  {
            cell.memberName.text = object.firstName + " " + object.lastName
           } else if object.firstName.isEmpty {
               cell.memberName.text = object.lastName
           } else {
               cell.memberName.text = object.firstName
           }
                   
           if object.age > 0 {
               cell.memberAge.text = "\(object.age)"
           }
           
           ButtonStateChanger.shared.changeFavouriteState(cell.favouriteButton,
                                                          flag: object.isFavorite)
           cell.favouriteButton.tag = index
       }
}
