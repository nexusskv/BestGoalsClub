//
//  CompanyObject+Decodable.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


extension CompanyObject: Decodable {
    
    /// ---> Function decode all properties from json container <--- ///
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CompanyCodingKeys.self)
        if let value = try values.decodeIfPresent(String.self, forKey: .objectId) {
            objectId = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .company) {
            company = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .website) {
            website = value
        }
            
        if let value = try values.decodeIfPresent(String.self, forKey: .logo) {
            logo = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .about) {
            about = value
        }
        
        if let value = try values.decodeIfPresent([MemberObject].self, forKey: .members) {
            members = value
        }
    }
}
