//
//  SortMembersView.swift
//  BestGoalsClub
//
//  Created by Rost on 11.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class SortMembersView: UIView {
    @IBOutlet weak var ageAscButton: UIButton!
    @IBOutlet weak var ageDescButton: UIButton!
    @IBOutlet weak var nameAscButton: UIButton!
    @IBOutlet weak var nameDescButton: UIButton!
    @IBOutlet weak var familyNameAscButton: UIButton!
    @IBOutlet weak var familyNameDescButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    var sortType: MembersSortTypes = .none


    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        self.roundCorners(12, border: 2.5, color: .darkGray)
        if let button = okButton {
            button.roundCorners(10, border: 1, color: .lightGray)
        }
        
        if let button = closeButton {
            let closeRadius = button.bounds.size.width / 2.0
            button.roundCorners(closeRadius, border: 1, color: .lightGray)
        }
    }
}
