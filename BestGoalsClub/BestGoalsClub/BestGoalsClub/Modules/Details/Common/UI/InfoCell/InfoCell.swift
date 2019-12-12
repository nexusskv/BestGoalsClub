//
//  InfoCell.swift
//  BestGoalsClub
//
//  Created by Rost on 12.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class InfoCell: UITableViewCell {
    @IBOutlet weak var infoTitle: UILabel!
    @IBOutlet weak var infoText: UITextView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        self.infoText.roundCorners(12, border: 1.5, color: .lightGray)
    }
    
    
    func setCellValues(_ object: CompanyObject, type: DetailsCompanyRows) {
        switch type {
            case .members:
                infoTitle.text = "Members of company:"
                var membersNames = String()

                for i in 0 ..< object.members.count {
                    let member = object.members[i]
                    
                    membersNames.append(member.firstName + " " + member.lastName + ", " + "\(member.age)")
                    
                    if i < object.members.count - 1 {
                        membersNames.append("\n")
                    }
                }
                
                infoText.text = membersNames
            case .about:
                infoTitle.text  = "About:"
                infoText.text   = object.about
            case .general:
                break
        }
    }
}
