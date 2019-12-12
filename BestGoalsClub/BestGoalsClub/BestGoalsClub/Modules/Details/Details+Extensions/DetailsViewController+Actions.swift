//
//  DetailsViewController+Actions.swift
//  BestGoalsClub
//
//  Created by Rost on 12.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension DetailsViewController {
    
    /// ---> Action for back item in the navigation bar <--- ///
    @IBAction func backItemTapped() {
        Router.dismiss(self)
    }
}
