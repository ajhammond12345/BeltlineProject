//
//  User.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class User: NSObject {
    var fname: String
    var lname: String
    var username: String
    var emails: [String]
    //add status
    
    func isVisitor() -> Bool {
        return false
    }
    
    init(first: String, last: String, uname: String, emailAddresses: [String]) {
        self.fname = first
        self.lname = last
        self.username = uname
        self.emails = emailAddresses
    }
}
