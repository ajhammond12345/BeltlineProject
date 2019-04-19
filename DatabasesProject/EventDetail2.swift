//
//  EventDetail2.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class EventDetail2: UIViewController {
    
    var event: Event?

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var site: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var ticketPrices: UILabel!
    @IBOutlet weak var ticketsRemaining: UILabel!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var visitDate: UITextField!
    
    @IBAction func logVisit(_ sender: Any) {
        if (visitDate.text != nil) {
            let newVisit: Visit = Visit(siteName: event!.siteName, username: Model.getInstance().getCurrentUser().username, date: visitDate.text!)
            newVisit.event = event
            Model.getInstance().logVisit(visit: newVisit)
        }
    }
    
    override func viewDidLoad() {
        name.text = event!.name
        site.text = event!.siteName
        startDate.text = event!.startDate
        endDate.text = event!.endDate
        ticketPrices.text = "\(String(describing: event!.price))"
        ticketsRemaining.text = "\(String(describing: event!.getTicketsRemaining()))"
        desc.text = event!.descript
        var staff: String = ""
        for member in event!.staffAssigned {
            staff.append("\(member)\n")
        }
        super.viewDidLoad()

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
