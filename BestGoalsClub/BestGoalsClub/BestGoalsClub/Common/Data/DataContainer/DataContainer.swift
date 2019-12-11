//
//  DataContainer.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class DataContainer {
    static let shared = DataContainer()
    private init() { }
    
    var allMembers: [MemberObject]?
}
