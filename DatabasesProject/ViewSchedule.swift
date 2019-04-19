//
//  ViewSchedule.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ViewSchedule: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Create cell
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedEvent = schedule[indexPath.row]
    }
    
    var selectedEvent: Event?
    var schedule: [Event] = []

    @IBOutlet weak var eventname: UITextField!
    @IBOutlet weak var keyword: UITextField!
    @IBOutlet weak var startdate: UITextField!
    @IBOutlet weak var enddate: UITextField!
    
    @IBAction func filter(_ sender: Any) {
        Model.getInstance().filterSchedule(staff: Model.getInstance().getCurrentUser() as! Employee, eventName: eventname.text, keyword: keyword.text, startDate: startdate.text, endDate: enddate.text)
        schedule = Model.getInstance().getSchedule()
        table.reloadData()
    }
    @IBOutlet weak var table: UITableView!
    @IBAction func viewevent(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //TODO
        /* if segue.destination is EventDetail {
         let dest = segue.destination as? EventDetail
         dest?.event = selectedEvent
         }*/
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        Model.getInstance().filterSchedule(staff: Model.getInstance().getCurrentUser() as! Employee, eventName: nil, keyword: nil, startDate: nil, endDate: nil)
        schedule = Model.getInstance().getSchedule()

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
