//
//  Site.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class Site: NSObject {
    var name: String
    var zip: String
    var address: String
    var managerUsername: String
    var openEveryday: Bool
    
    init(name: String, zip: String, address: String, managerUsername: String, openEveryday: Bool) {
        self.name = name
        self.zip = zip
        self.address = address
        self.managerUsername = managerUsername
        self.openEveryday = openEveryday
    }
}
