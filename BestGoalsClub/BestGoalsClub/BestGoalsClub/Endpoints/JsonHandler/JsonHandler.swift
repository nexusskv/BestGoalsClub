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
            let json = try JSONSerialization.jsonObject(with: sender, options: .allowFragments) as? [[String: AnyObject]]
            
            if let array = json {
                return array as AnyObject
            } else {
                return "Serialization error" as AnyObject
            }
        } catch let error {
            return error.localizedDescription as AnyObject
        }
    }
}
