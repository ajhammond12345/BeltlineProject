//
//  Transit.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class Transit: NSObject {
    
    var type: String
    var route: String
    var price: Float
    var connectedSites: [String]
    
    init(type: String, route: String, price: Float, connectedSites: [String]) {
        self.type = type
        self.route = route
        self.price = price
        self.connectedSites = connectedSites
    }

}
