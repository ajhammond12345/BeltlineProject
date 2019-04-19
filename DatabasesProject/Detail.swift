//
//  Detail.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/19/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class Detail: NSObject {
    
    var event: String
    var staff: [String]
    var visits: Int
    var revenue: Float
    
    init(event: String, staff: [String], visits: Int, revenue: Float) {
        self.event = event
        self.staff = staff
        self.visits = visits
        self.revenue = revenue
    }

}
