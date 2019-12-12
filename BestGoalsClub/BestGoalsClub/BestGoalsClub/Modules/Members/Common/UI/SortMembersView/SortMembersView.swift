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
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    var sortType: MembersSortTypes = .none

    /// ---> Constructor function <--- ///
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)

    }
    
    
    /// ---> View life cycle <--- ///
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    
    /// ---> Function for UI customisations <--- ///
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
