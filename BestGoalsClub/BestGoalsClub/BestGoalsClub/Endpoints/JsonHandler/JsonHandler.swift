//
//  JsonHandler.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class JsonHandler {
    
    /// ---> Function for handle received data <--- ///
    static func handleData(_ sender: Data) -> AnyObject {
        do {
            let companies = try JSONDecoder().decode([CompanyObject].self, from: sender)
            
            if companies.count > 0 {
                return companies as AnyObject
            } else {
                return "Serialization error" as AnyObject
            }
        } catch let error {
            return error.localizedDescription as AnyObject
        }
    }
}
