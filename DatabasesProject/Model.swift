//
//  Model.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/16/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit



class Model: NSObject {
    
    //Model Stuff
    private static let model = Model()
    
    public static func getInstance() -> Model {
        return model;
    }
    
    
    //User Stuff
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
    private var currentUser: User?

    func setUserType(type: Int) {
        userType = type
    }
    
    func getUserType() -> Int {
        return userType
    }
    
    func setCurrentUser(user: User) {
        currentUser = user
    }
    
    func getCurrentUser() -> User {
        return currentUser!
    }
    
    func login(email: String, password: String) -> Bool {
        //TODO: implement login
        return true;
    }
    
    func register(user: User, password: String) -> Bool {
        //TODO: implement register
        
        setCurrentUser(user: user)
        var utype: Int = 0
        if user.isVisitor() {
            utype += 1
        }
        if type(of: user) == Employee.self || type(of: user) == EmployeeVisitor.self {
            let tmp: Employee = (user as! Employee)
            if tmp.type == 0 {
                utype = 2
            }
            if tmp.type == 1 {
                utype = 3
            }
            if tmp.type == 2 {
                utype = 4
            }
        }
        if type(of: user) == EmployeeVisitor.self {
            utype += 3
        }
        setUserType(type: utype)
        return true;
    }
    
    
    
    
    
    //Employee Stuff
    
    private var managers: [Employee] = []
    private var staff: [Employee] = []
    private var filteredStaff: [Employee] = []
    
    func getManagers() -> [Employee] {
        //TODO: load managers
        return managers
    }
    
    func getStaff() -> [Employee] {
        return staff
    }
    
    func getFilteredStaff() -> [Employee] {
        return filteredStaff
    }
    
    func filterStaff(fname: String?, lname: String?, startDate: String?, endDate: String?) {
        //TODO: Filter staff
    }
    
    
    
    
    
    
    //Event stuff
    private var events: [Event] = []
    private var filteredEvents: [Event] = []
    
    func getEvents() -> [Event] {
        return events
    }
    
    func getFilteredEvents() -> [Event] {
        return filteredEvents
    }
    
    func filterEvents(site: Site?, name: String?, keywoard: String?, startDate: String?, endDate: String?, durationStart: String?, durationEnd: String?, visitsStart: String?, visitsEnd: String?, revenueStart: String?, revenueEnd: String?, staffCountLow: String?, staffCountHigh: String?, eventCountLow: String?, eventCountHigh: String?) {
        //TODO filter sites
    }
    
    func createEvent(event: Event) {
        //TODO create site
    }
    
    func updateEvent(event: Event) {
        //TODO update site
    }
    
    func deleteEvent(event: Event) {
        //TODO delete site
    }
    
    
    
    
    
    //Site Stuff
    private var sites: [Site] = []
    private var filteredSites: [Site] = []
    
    func getSites() -> [Site] {
        //TODO: load sites
        return sites
    }
    
    func getFilteredSites() -> [Site] {
        return filteredSites
    }
    
    func filterSites(open: Bool, manager: Employee?, site: Site?) {
        //TODO filter sites
    }
    
    func createSite(site: Site) {
        //TODO create site
    }
    
    func updateSite(site: Site) {
        //TODO update site
    }
    
    func deleteSite(site: Site) {
        //TODO delete site
    }
    
    
    
    
    
    //Transit Stuff
    private var transits: [Transit] = []
    private var filteredTransits: [Transit] = []
    
    func getTransits() -> [Transit] {
        return transits
    }
    
    func getFilteredTransits() -> [Transit] {
        return filteredTransits
    }
    
    func filterTransits(route: String?, transportType: String?, site: Site?, priceLow: String?, priceHigh: String?) {
        //TODO filter transits
    }
    
    func createTransit(transit: Transit) {
        
    }
    
    func updateTransite(transit: Transit) {
        
    }
    
    func deleteTransit(transit: Transit) {
        
    }
}
