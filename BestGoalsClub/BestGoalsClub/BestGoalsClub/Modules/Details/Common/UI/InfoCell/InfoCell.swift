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

    /// ---> Cell lifecycle <--- ///
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    
    /// ---> UI customisations <--- ///
    private func setupUI() {
        self.infoText.roundCorners(12, border: 1.5, color: .lightGray)
    }
}
