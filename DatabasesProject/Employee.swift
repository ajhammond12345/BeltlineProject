//
//  Employee.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class Employee: User {
    var phone: String
    var address: String
    var city: String
    var state: String
    var zip: String
    var type: Int //Admin: 0, Manager: 1, Staff: 2
    var site: Site?
    
    init(first: String, last: String, uname: String, emailAddr: [String], phoneNum: String, addr: String, cit: String, st: String, zp: String, utype: Int) {
        self.phone = phoneNum
        self.address = addr
        self.city = cit
        self.state = st
        self.zip = zp
        self.type = utype
        super.init(first: first, last: last, uname: uname, emailAddresses: emailAddr)
        
    }
    
    func setSite(newSite: Site) {
        site = newSite
    }
    
    func getSite() -> Site? {
        return site
    }
}
