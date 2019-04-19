//
//  ManageEvent.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ManageEvent: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Create cell
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedEvent = events[indexPath.row]
    }
    
    
    var events: [Event] = []
    var selectedEvent: Event?

    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var keyword: UITextField!
    @IBOutlet weak var startdate: UITextField!
    @IBOutlet weak var enddate: UITextField!
    @IBOutlet weak var durrationlow: UITextField!
    @IBOutlet weak var durationhigh: UITextField!
    @IBOutlet weak var visitslow: UITextField!
    @IBOutlet weak var visitshigh: UITextField!
    @IBOutlet weak var revlow: UITextField!
    @IBOutlet weak var revhigh: UITextField!
    
    @IBAction func filter(_ sender: Any) {
        let employee: Employee = Model.getInstance().getCurrentUser() as! Employee
        Model.getInstance().filterEvents(site: employee.getSite(), name: name.text, keywoard: keyword.text, startDate: startdate.text, endDate: enddate.text, durationStart: durrationlow.text, durationEnd: durationhigh.text, visitsStart: visitslow.text, visitsEnd: visitshigh.text, revenueStart: revlow.text, revenueEnd: revhigh.text, staffCountLow: nil, staffCountHigh: nil, eventCountLow: nil, eventCountHigh: nil, priceLow: nil, priceHigh: nil)
        events = Model.getInstance().getFilteredEvents()
        table.reloadData()
        
    }
    @IBOutlet weak var table: UITableView!
    @IBAction func create(_ sender: Any) {
    }
    @IBAction func edit(_ sender: Any) {
        //performSegue(withIdentifier: "manage_to_edit_event", sender: self)
    }
    @IBAction func deletebutton(_ sender: Any) {
        if (selectedEvent != nil) {
            Model.getInstance().deleteEvent(event: selectedEvent!)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //TODO
        /* if segue.destination is EditEvent {
         let dest = segue.destination as? EditEvent
         dest?.event = selectedEvent
         }*/
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        let employee: Employee = Model.getInstance().getCurrentUser() as! Employee
        Model.getInstance().filterEvents(site: employee.getSite(), name: nil, keywoard: nil, startDate: nil, endDate: nil, durationStart: nil, durationEnd: nil, visitsStart: nil, visitsEnd: nil, revenueStart: nil, revenueEnd: nil, staffCountLow: nil, staffCountHigh: nil, eventCountLow: nil, eventCountHigh: nil, priceLow: nil, priceHigh: nil)
        events = Model.getInstance().getFilteredEvents()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
