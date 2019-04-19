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
    
    func getUserStatuses() -> [String] {
        return ["All", "Approved", "Pending", "Declined"]
    }
    
    func getUserTypes() -> [String] {
        return ["All", "User", "Visitor", "Administrator", "Manager", "Staff", "Administrator-Visitor", "Manager-Visitor", "Staff-Visitor"]
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
    var userList: [User] = []
    var filteredUserList: [User] = []

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
    
    func getUserList() -> [User] {
        return userList
    }
    
    func getFilteredUserList() -> [User] {
        return filteredUserList
    }
    
    func filterUsers(username: String?, type: Int?, status: String?) {
        //TODO: filter user list
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
    
    func updateUser(oldUser: User, newUser: User) {
        
    }
    
    func declineUser(user: User) {
        //TODO: Decline user
    }
    
    func acceptUser(user: User) {
        //TODO: accept user
    }
    
    
    
    
    
    //Employee Stuff
    
    private var managers: [Employee] = []
    private var staff: [Employee] = []
    private var filteredStaff: [Employee] = []
    private var schedule: [Event] = []
    
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
    
    func getSchedule() -> [Event] {
        return schedule
    }
    
    func filterStaff(fname: String?, lname: String?, startDate: String?, endDate: String?) {
        //TODO: Filter staff
    }
    
    func filterSchedule(staff: Employee, eventName: String?, keyword: String?, startDate: String?, endDate: String?) {
        //TODO: Filter assigned, save to schedule
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
    
    func filterEvents(site: Site?, name: String?, keywoard: String?, startDate: String?, endDate: String?, durationStart: String?, durationEnd: String?, visitsStart: String?, visitsEnd: String?, revenueStart: String?, revenueEnd: String?, staffCountLow: String?, staffCountHigh: String?, eventCountLow: String?, eventCountHigh: String?, priceLow: String?, priceHigh: String?) {
        //TODO filter sites
    }
    
    func createEvent(event: Event) {
        //TODO create site
    }
    
    func updateEvent(newEvent: Event, oldEvent: Event) {
        //TODO update site
    }
    
    func deleteEvent(event: Event) {
        //TODO delete site
    }
    
    
    
    
    
    //Site Stuff
    private var sites: [Site] = []
    private var filteredSites: [Site] = []
    private var exploreFilteredSites: [Site] = []
    
    func getSites() -> [Site] {
        //TODO: load sites
        return sites
    }
    
    func getFilteredSites() -> [Site] {
        return filteredSites
    }
    
    func getExploreFilteredSites() -> [Site] {
        return exploreFilteredSites
    }
    
    func filterSites(open: Bool, manager: Employee?, site: Site?) {
        //TODO filter sites
    }
    
    func exploreSites(site: Site?, startDate: String?, endDate: String?, openEveryday: Bool, includeVisited: Bool, visitsLow: String?, visitsHigh: String?, eventCountLow: String?, eventCountHigh: String?) {
        //TODO explore sites
    }
    
    func createSite(site: Site) {
        //TODO create site
    }
    
    func updateSite(newSite: Site, oldSite: Site) {
        //TODO update site
    }
    
    func deleteSite(site: Site) {
        //TODO delete site
    }
    
    
    
    
    
    //Transit Stuff
    private var transportTypes = ["Bike", "Bus", "MARTA"]
    private var transits: [Transit] = []
    private var filteredTransits: [Transit] = []
    
    func getTransits() -> [Transit] {
        return transits
    }
    
    func getFilteredTransits() -> [Transit] {
        return filteredTransits
    }
    
    func getTransportTypes() -> [String] {
        return transportTypes
    }
    
    func filterTransits(route: String?, transportType: String?, site: Site?, priceLow: String?, priceHigh: String?) {
        var lowPrice: Float = 0.0
        var highPrice: Float = 100.0
        if (priceLow != nil) {
            
        }
        if (priceHigh != nil) {
            
        }
        print("Filtering Transit")
        //TODO filter transits
    }
    
    func createTransit(transit: Transit) {
        print("Create Transit")
        //TODO: Create transit
    }
    
    func updateTransite(newTransit: Transit, oldTransit: Transit) {
        print("Update Transit")
        //TODO: Update Transit
        
    }
    
    func deleteTransit(transit: Transit) {
        print("Delete Transit")
        //TODO: Delete Transit
    }
    
    func logTransit(transit: Transit, user: User, date: String) {
        print("Log Transit")
        //TODO: Log Transit
    }
    
    
    
    
    //Visit Stuff
    var visits: [Visit] = []
    var filteredVisits: [Visit] = []
    
    func getVisits() -> [Visit] {
        return visits
    }
    
    func getFilteredVisits() -> [Visit] {
        return filteredVisits
    }
    
    func filterVisits(visitor: Visitor?, name: String?, startDate: String?, endDate: String?, site: Site?) {
    
        //TODO: filter visits
        
    }
    
    func logVisit(visit: Visit) {
        if visit.event != nil {
            //TODO: Log event visit
        } else {
            //TODO: Log site visit
        }
    }
}
