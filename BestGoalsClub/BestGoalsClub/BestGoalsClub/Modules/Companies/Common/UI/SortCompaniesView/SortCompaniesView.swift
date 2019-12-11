//
//  SortCompaniesView.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class SortCompaniesView: UIView {
    @IBOutlet weak var ascButton: UIButton!
    @IBOutlet weak var descButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    var sortType: CompaniesSortTypes = .none


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
