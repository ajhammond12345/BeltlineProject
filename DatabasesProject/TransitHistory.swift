//
//  TransitHistory.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/20/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class TransitHistory: NSObject {
    var date: String
    var route: String
    var type: String
    var price: Float

    init(date: String, route: String, type: String, price: Float) {
        self.date = date
        self.route = route
        self.type = type
        self.price = price
    }
}
