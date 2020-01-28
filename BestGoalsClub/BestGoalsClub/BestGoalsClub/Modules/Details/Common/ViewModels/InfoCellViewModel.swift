//
//  InfoCellViewModel.swift
//  BestGoalsClub
//
//  Created by Rost on 28.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class InfoCellViewModel {
    
    /// ---> Function for set values to UI from object <--- ///
    func setCellValues(_ cell: InfoCell, object: CompanyObject, type: DetailsCompanyRows) {
        switch type {
            case .members:
                cell.infoTitle.text = "Members of company:"
                var membersNames = String()

                for i in 0 ..< object.members.count {
                    let member = object.members[i]
                    
                    membersNames.append(member.firstName + " " + member.lastName + ", " + "\(member.age)")
                    
                    if i < object.members.count - 1 {
                        membersNames.append("\n")
                    }
                }
                
                cell.infoText.text = membersNames
            case .about:
                cell.infoTitle.text  = "About:"
                cell.infoText.text   = object.about
            case .general:
                break
        }
    }
}
