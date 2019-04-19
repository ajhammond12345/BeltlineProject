//
//  Event.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class Event: NSObject {
    
    var name: String
    var siteName: String
    var price: Float
    var capacity: Int
    var startDate: String
    var endDate: String
    var minStaffRequired: Int
    var staffAssigned: [String]
    var descript: String
    var duration: Int?
    var ticketsRemaining: Int?
    
    init(name: String, price: Float, capacity: Int, startDate: String, endDate: String, minStaffRequired: Int, staffAssigned: [String], descript: String, siteName: String) {
        self.name = name
        self.siteName = siteName
        self.price = price
        self.capacity = capacity
        self.startDate = startDate
        self.endDate = endDate
        self.minStaffRequired = minStaffRequired
        self.staffAssigned = staffAssigned
        self.descript = descript
    }
    
    func setDuration(duration: Int) {
        self.duration = duration
    }
    
    func getDuration() -> Int {
        if duration == nil {
            return 0
        } else {
            return duration!
        }
    }
    
    func setTicketsRemaining(ticketsRemaining: Int) {
        self.ticketsRemaining = ticketsRemaining
    }
    
    func getTicketsRemaining() -> Int {
        if ticketsRemaining == nil {
            return 0
        } else {
            return ticketsRemaining!
        }
    }

}
