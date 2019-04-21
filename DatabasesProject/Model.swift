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
        setCurrentUser(user: Employee(first: "Alexander", last: "Hammond", uname: "ahammond", emailAddr: ["ajhammond123@gmail.com"], phoneNum: "4048456798", addr: "1060 Standard Dr.", cit: "Atlanta", st: "GA", zp: "30319", utype: 0))
        setUserType(type: 2)
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
    
    var tempManager = Employee(first: "Bob", last: "Smith", uname: "bsmith", emailAddr: ["bsmith@gmail.com"], phoneNum: "5555555505", addr: "123 Cherry Lane", cit: "New York", st: "NY", zp: "10001", utype: 3)
    private var managers: [Employee] = []
    private var staff: [Employee] = []
    private var filteredStaff: [Employee] = []
    private var schedule: [Event] = []
    
    func getManagers() -> [Employee] {
        managers = [tempManager]
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
        if schedule.elementsEqual([]) {
            schedule = [tmpEvent, tmpEvent2]
        }
        return schedule
    }
    
    func filterStaff(fname: String?, lname: String?, startDate: String?, endDate: String?) {
        //TODO: Filter staff
    }
    
    func filterSchedule(staff: Employee, eventName: String?, keyword: String?, startDate: String?, endDate: String?) {
        schedule = [tmpEvent2]
        //TODO: Filter assigned, save to schedule
    }
    
    
    
    
    
    
    
    //Event stuff
    let tmpEvent = Event(name: "Fun Event", price: 9.90, capacity: 100, startDate: "4/4/2019", endDate: "5/5/2019", minStaffRequired: 0, staffAssigned: [], descript: "A really fun time", siteName: "Piedmont Park")
    let tmpEvent2 = Event(name: "Yee Yee Event", price: 4.20, capacity: 69, startDate: "4/20/2020", endDate: "5/5/2020", minStaffRequired: 0, staffAssigned: [], descript: "A really really fun time", siteName: "Centennial Park")
    
    private var events: [Event] = []
    private var filteredEvents: [Event] = []
    private var exploreFilteredEvents: [Event] = []
    
    func getEvents() -> [Event] {
        events = [tmpEvent, tmpEvent2]
        return events
    }
    
    func getFilteredEvents() -> [Event] {
        return filteredEvents
    }
    
    func getExploreFilteredEvents() -> [Event] {
        return exploreFilteredEvents
    }
    
    func filterEvents(site: Site?, name: String?, keywoard: String?, startDate: String?, endDate: String?, durationStart: String?, durationEnd: String?, visitsStart: String?, visitsEnd: String?, revenueStart: String?, revenueEnd: String?, staffCountLow: String?, staffCountHigh: String?, eventCountLow: String?, eventCountHigh: String?, priceLow: String?, priceHigh: String?) {
        filteredEvents = [tmpEvent]
        //TODO filter sites
    }
    
    func exploreEvents(site: Site?, name: String?, keywoard: String?, startDate: String?, endDate: String?, durationStart: String?, durationEnd: String?, visitsStart: String?, visitsEnd: String?, revenueStart: String?, revenueEnd: String?, staffCountLow: String?, staffCountHigh: String?, eventCountLow: String?, eventCountHigh: String?, priceLow: String?, priceHigh: String?, username: String?) {
        tmpEvent2.ticketsRemaining = 20
        tmpEvent2.totalVisits = 100
        tmpEvent2.myVisits = 12
        exploreFilteredEvents = [tmpEvent2]
        //TODO filter explore sites
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
    
    
    
    
    let tmpSite1 = Site(name: "Piedmont Park", zip: "30303", address: "1111 Piedmont Rd, Atlanta, GA", managerUsername: "ahammond", openEveryday: true)
    let tmpSite2 = Site(name: "Tech Green", zip: "40404", address: "1111 GAtech Rd, Atlanta, GA", managerUsername: "ahammond", openEveryday: false)
    let tmpSite3 = Site(name: "Centennial Park", zip: "50505", address: "1111 Centennial Rd, Atlanta, GA", managerUsername: "ahammond", openEveryday: true)
    
    
    //Site Stuff
    private var sites: [Site] = []
    private var filteredSites: [Site] = []
    private var exploreFilteredSites: [Site] = []
    
    func getSites() -> [Site] {
        //TODO: load sites
        sites = [tmpSite1, tmpSite2, tmpSite3]
        return sites
    }
    
    func getFilteredSites() -> [Site] {
        return filteredSites
    }
    
    func getExploreFilteredSites() -> [Site] {
        return exploreFilteredSites
    }
    
    func filterSites(open: Bool, manager: Employee?, site: Site?) {
        filteredSites = [getSites()[0], getSites()[1]]
        //TODO filter sites
    }
    
    func exploreSites(site: Site?, startDate: String?, endDate: String?, openEveryday: Bool, includeVisited: Bool, visitsLow: String?, visitsHigh: String?, eventCountLow: String?, eventCountHigh: String?) {
        tmpSite1.eventCount = 5
        tmpSite1.totalVisits = 100
        tmpSite1.myVisits = 0
        tmpSite2.eventCount = 10
        tmpSite2.totalVisits = 1000
        tmpSite2.myVisits = 5
        exploreFilteredSites = [tmpSite1, tmpSite2]
        //TODO explore sites
    }
    
    func createSite(site: Site) {
        print("creating site")
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
    private var transits: [Transit] = [Transit(type: "MARTA", route: "517", price: 5.50, connectedSites: ["Piedmont Park", "Centennial Park"]), Transit(type: "Bike", route: "315", price: 0, connectedSites: ["Piedmont Park", "Tech Green"])]
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
        filteredTransits = [transits[0]]
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
    
    
    
    //Transit History
    var transitHistory: [TransitHistory] = [TransitHistory(date: "5/5/2019", route: "315", type: "MARTA", price: 5.50), TransitHistory(date: "4/2/2020", route: "206", type: "MARTA", price: 9.01)]
    var filteredTransitHistory: [TransitHistory] = []
    
    func getTransitHistory() -> [TransitHistory] {
        return transitHistory
    }
    
    func getFilteredTransitHistory() -> [TransitHistory] {
        return filteredTransitHistory
    }
    
    func filterTransitHistory(site: Site?, type: String?, startDate: String?, endDate: String?, route: String?) {
        //TODO: filterTransitHistory
        filteredTransitHistory = [transitHistory[1]]
    }
    
    func logTransit(transit: Transit, user: User, date: String) {
        print("Log Transit: Transit: \(transit.route) User: \(user.username) Date: \(date)")
        //TODO: Log Transit
    }
    
    
    
    
    //Visit Stuff
    let tmpVisit: Visit = Visit(siteName: "Piedmont Park", username: "ahammond", date: "5/5/2019")
    let tmpVisit2: Visit = Visit(siteName: "Centennial Park", username: "ahammond", date: "4/4/2019")
    var visits: [Visit] = []
    var filteredVisits: [Visit] = []
    
    func getVisits() -> [Visit] {
        return visits
    }
    
    func getFilteredVisits() -> [Visit] {
        return filteredVisits
    }
    
    func filterVisits(visitor: User?, name: String?, startDate: String?, endDate: String?, site: Site?) {
        tmpVisit.event = tmpEvent
        filteredVisits.append(tmpVisit)
        filteredVisits.append(tmpVisit2)
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
