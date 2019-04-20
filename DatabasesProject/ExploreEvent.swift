//
//  ExploreEvent.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ExploreEvent: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sites.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedSite = sites[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sites[row].name
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ExploreEventCell = tableView.dequeueReusableCell(withIdentifier: "event_cell", for: indexPath) as? ExploreEventCell  else {
            fatalError("The dequeued cell is not an instance of ExploreEventCell.")
        }
        let event = events[indexPath.row]
        cell.eventName.text = event.name
        cell.ticketPrice.text = String(describing: event.price)
        cell.totalVisits.text = String(describing: event.totalVisits ?? 0)
        cell.siteName.text = event.siteName
        cell.ticketsRemaining.text = String(describing: event.ticketsRemaining ?? 0)
        cell.myVisits.text = String(describing: event.myVisits ?? 0)
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedEvent = events[indexPath.row]
    }
    
    
    var events: [Event] = Model.getInstance().getExploreFilteredEvents()
    var selectedEvent: Event?
    
    var sites: [Site] = Model.getInstance().getSites()
    var selectedSite: Site?


    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var keyword: UITextField!
    @IBOutlet weak var startdate: UITextField!
    @IBOutlet weak var enddate: UITextField!
    @IBOutlet weak var sitename: UIPickerView!
    @IBOutlet weak var visitslow: UITextField!
    @IBOutlet weak var visitshigh: UITextField!
    @IBOutlet weak var ticketPriceLow: UITextField!
    @IBOutlet weak var ticketPriceHigh: UITextField!
    
    @IBAction func filter(_ sender: Any) {
        Model.getInstance().exploreEvents(site: selectedSite, name: name.text, keywoard: keyword.text, startDate: startdate.text, endDate: enddate.text, durationStart: nil, durationEnd: nil, visitsStart: visitslow.text, visitsEnd: visitshigh.text, revenueStart: nil, revenueEnd: nil, staffCountLow: nil, staffCountHigh: nil, eventCountLow: nil, eventCountHigh: nil, priceLow: ticketPriceLow.text, priceHigh: ticketPriceHigh.text, username: Model.getInstance().getCurrentUser().username)
        events = Model.getInstance().getExploreFilteredEvents()
        table.reloadData()
    }
    @IBOutlet weak var table: UITableView!
    @IBAction func eventDetail(_ sender: Any) {
        if selectedEvent != nil {
            performSegue(withIdentifier: "to_event_detail2", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.destination is EventDetail2 {
            let dest = segue.destination as? EventDetail2
            dest?.event = selectedEvent
         }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sitename.delegate = self
        sitename.dataSource = self
        table.delegate = self
        table.dataSource = self
        Model.getInstance().exploreEvents(site: nil, name: nil, keywoard: nil, startDate: nil, endDate: nil, durationStart: nil, durationEnd: nil, visitsStart: nil, visitsEnd: nil, revenueStart: nil, revenueEnd: nil, staffCountLow: nil, staffCountHigh: nil, eventCountLow: nil, eventCountHigh: nil, priceLow: nil, priceHigh: nil, username: Model.getInstance().getCurrentUser().username)
        events = Model.getInstance().getExploreFilteredEvents()

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
