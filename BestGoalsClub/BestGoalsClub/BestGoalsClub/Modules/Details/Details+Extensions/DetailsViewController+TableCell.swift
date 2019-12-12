//
//  DetailsViewController+TableCell.swift
//  BestGoalsClub
//
//  Created by Rost on 12.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension DetailsViewController {
    
    func makeCellHeight(_ index: IndexPath) -> CGFloat {
        switch selectedType {
            case .member:
                return 204.0
            
            case .company:
                if let type = DetailsCompanyRows(rawValue: index.row) {
                    switch type {
                        case .general:
                            return 193.0
                        case .members, .about:
                            return 182.0
                    }
                }
            
            case .none:
                return 0.0
        }
        
        return 0.0
    }
    
    func makeRowsCount() -> Int {
        switch selectedType {
            case .member:
                return 1
            case .company:
                return 3
            case .none:
                return 0
        }
    }
        
    func makeCell(_ table: UITableView, at index: IndexPath) -> UITableViewCell {
        switch selectedType {
            case .member:
                let cell = table.dequeueReusableCell(withIdentifier: "MembersDetailsCell", for: index) as? MembersDetailsCell
                
                if let object = DataContainer.shared.selectedObject as? MemberObject {
                    cell?.setCellValues(object)
                }
                
                return cell ?? MembersDetailsCell()
            case .company:
                if let type = DetailsCompanyRows(rawValue: index.row) {
                    switch type {
                        case .general:
                            let cell = table.dequeueReusableCell(withIdentifier: "CompaniesDetailsCell", for: index) as? CompaniesDetailsCell
                            
                            if let object = DataContainer.shared.selectedObject as? CompanyObject {
                                cell?.setCellValues(object)
                            }

                            return cell ?? CompaniesDetailsCell()
                        case .members, .about:
                            let cell = table.dequeueReusableCell(withIdentifier: "InfoCell", for: index) as? InfoCell
                            
                            if let object = DataContainer.shared.selectedObject as? CompanyObject {
                                cell?.setCellValues(object, type: type)
                            }

                            return cell ?? InfoCell()
                    }
                }

            case .none:
                return UITableViewCell()
        }
        
        return UITableViewCell()
    }
}
