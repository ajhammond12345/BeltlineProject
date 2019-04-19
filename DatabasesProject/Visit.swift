//
//  Visit.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/19/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class Visit: NSObject {
    var event: Event?
    var siteName: String
    var username: String
    var date: String
    
    init(siteName: String, username: String, date: String) {
        self.siteName = siteName
        self.username = username
        self.date = date
    }
    

}
