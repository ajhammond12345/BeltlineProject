//
//  SiteReport.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class SiteReport: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Create cell
        return UITableViewCell()
    }
    
    var events: [Event] = []

    @IBOutlet weak var startdate: UITextField!
    @IBOutlet weak var enddate: UITextField!
    @IBOutlet weak var staffcountlow: UITextField!
    @IBOutlet weak var staffcounthigh: UITextField!
    @IBOutlet weak var eventcountlow: UITextField!
    @IBOutlet weak var eventcounthigh: UITextField!
    @IBOutlet weak var totalvisitslow: UITextField!
    @IBOutlet weak var totalvisitshigh: UITextField!
    @IBOutlet weak var totalrevlow: UITextField!
    @IBOutlet weak var totalrevhigh: UITextField!
    
    @IBAction func filter(_ sender: Any) {
        let employee: Employee = Model.getInstance().getCurrentUser() as! Employee
        Model.getInstance().filterEvents(site: employee.getSite(), name: nil, keywoard: nil, startDate: startdate.text, endDate: enddate.text, durationStart: nil, durationEnd: nil, visitsStart: totalvisitslow.text, visitsEnd: totalvisitshigh.text, revenueStart: totalrevlow.text, revenueEnd: totalrevhigh.text, staffCountLow: staffcountlow.text, staffCountHigh: staffcounthigh.text, eventCountLow: eventcountlow.text, eventCountHigh: eventcounthigh.text)
        events = Model.getInstance().getFilteredEvents()
        table.reloadData()
    }
    
    @IBOutlet weak var table: UITableView!
    
    @IBAction func dailydetail(_ sender: Any) {
        performSegue(withIdentifier: "to_daily_detail", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        let employee: Employee = Model.getInstance().getCurrentUser() as! Employee
        Model.getInstance().filterEvents(site: employee.getSite(), name: nil, keywoard: nil, startDate: nil, endDate: nil, durationStart: nil, durationEnd: nil, visitsStart: nil, visitsEnd: nil, revenueStart: nil, revenueEnd: nil, staffCountLow: nil, staffCountHigh: nil, eventCountLow: nil, eventCountHigh: nil)
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
