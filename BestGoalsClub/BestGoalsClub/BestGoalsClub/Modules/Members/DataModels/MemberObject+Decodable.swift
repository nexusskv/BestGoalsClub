//
//  MemberObject+Decodable.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


extension MemberObject: Decodable {
    
    /// ---> Function decode all properties from json container <--- ///
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: MemberCodingKeys.self)
        if let value = try values.decodeIfPresent(String.self, forKey: .objectId) {
            objectId = value
        }
        
        if let value = try values.decodeIfPresent([String: String].self, forKey: .name) {
            if let first = value["first"] {
                firstName = first
            }
            
            if let last = value["last"] {
                lastName = last
            }
        }
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .age) {
            age = value
        }
            
        if let value = try values.decodeIfPresent(String.self, forKey: .email) {
            email = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .phone) {
            phone = value
        }
    }
}
