//
//  EndpointsManager.swift
//  BestGoalsClub
//
//  Created by Rost on 27.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class EndpointsManager {
    
    /// ---> Function for download data source from server API <--- ///
    func loadCompanies(_ view: CompaniesViewController) {
        GetListData.loadList(dataUrl, completion: { result in            
            if let model = view.viewModel {
                model.handleLoadedResult(view, result: result)
            }
        })
    }
}
