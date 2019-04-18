//
//  Model.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/16/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit



class Model: NSObject {
    
    private static let model = Model()
    /*
 User Types:
 0: User
 1: Visitor
 2: Admin
 3: Manager
 4: Staff
 5: Admin-Visitor
 6: Manager-Visitor
 7: Staff-Visitor
 */
    private var userType: Int = 0
    
    func setUserType(type: Int) {
        userType = type
    }
    
    func getUserType() -> Int {
        return userType
    }
    
    func login(email: String, password: String) -> Bool {
        //TODO: implement login
        return true;
    }
    
    func register(email: String, password: String) -> Bool {
        //TODO: implement login
        return true;
    }
    
    
    
    public static func getInstance() -> Model {
        return model;
    }
    
}
