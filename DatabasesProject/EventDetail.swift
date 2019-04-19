//
//  EventDetail.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class EventDetail: UIViewController {
    
    var event: Event?

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var site: UILabel!
    @IBOutlet weak var durationDays: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var capacity: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var staffAssigned: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = event!.name
        site.text = event!.siteName
        durationDays.text = "\(String(describing: event!.getDuration()))"
        startDate.text = event!.startDate
        endDate.text = event!.endDate
        capacity.text = "\(String(describing: event!.capacity))"
        price.text = "\(String(describing: event!.price))"
        desc.text = event!.descript
        var staff: String = ""
        for member in event!.staffAssigned {
            staff.append("\(member)\n")
        }
        
        

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
