//
//  ExploreEvent.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ExploreEvent: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Create cell
        return UITableViewCell()
    }
    
    
    var events: [Event] = []
    var selectedEvent: Event?
    
    var sites: [Site] = []
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
        Model.getInstance().filterEvents(site: selectedSite, name: name.text, keywoard: keyword.text, startDate: startdate.text, endDate: enddate.text, durationStart: nil, durationEnd: nil, visitsStart: visitslow.text, visitsEnd: visitshigh.text, revenueStart: nil, revenueEnd: nil, staffCountLow: nil, staffCountHigh: nil, eventCountLow: nil, eventCountHigh: nil, priceLow: ticketPriceLow.text, priceHigh: ticketPriceHigh.text)
        events = Model.getInstance().getFilteredEvents()
        table.reloadData()
    }
    @IBOutlet weak var table: UITableView!
    @IBAction func eventDetail(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //TODO
        /* if segue.destination is EventDetail2 {
         let dest = segue.destination as? EventDetail2
         dest?.event = selectedEvent
         }*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        Model.getInstance().filterEvents(site: nil, name: nil, keywoard: nil, startDate: nil, endDate: nil, durationStart: nil, durationEnd: nil, visitsStart: nil, visitsEnd: nil, revenueStart: nil, revenueEnd: nil, staffCountLow: nil, staffCountHigh: nil, eventCountLow: nil, eventCountHigh: nil, priceLow: nil, priceHigh: nil)
        events = Model.getInstance().getFilteredEvents()
        sites = Model.getInstance().getSites()

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
