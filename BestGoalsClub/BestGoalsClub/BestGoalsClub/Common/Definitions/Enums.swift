//
//  Enums.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation

enum CompanyCodingKeys: String, CodingKey {
    case objectId = "_id"
    case company
    case website
    case logo
    case about
    case members
}

enum MemberCodingKeys: String, CodingKey {
    case objectId = "_id"
    case name
    case age
    case email
    case phone
}

enum CompanyObjectTypes: Int {
    case follower = 0
    case favourite
}

enum CompaniesSortTypes: Int {
    case none = 0
    case asc
    case desc
}

enum FinalActionsTypes: Int {
    case close = 0
    case ok
}

enum MembersSortTypes: Int {
    case none = 0
    case namesAsc
    case namesDesc
    case ageAsc
    case ageDesc
}

