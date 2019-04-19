//
//  ViewEditEvent.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ViewEditEvent: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView.tag == 1) {
            return staff.count
        } else {
            //Insert support for daily detail table
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO Create cell
        //TODO for staff assigned check if cell in staffAssigned list and select if so
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if (tableView.tag == 1) { staffAssigned.append(staff[indexPath.row].username)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let deselected = staff[indexPath.row].username
        var i: Int = 0
        var index: Int = -1
        for staffMember in staffAssigned {
            if staffMember == deselected {
                index = i
            }
            i += 1
        }
        staffAssigned.remove(at: index)
    }
    
    var event: Event?
    
    var staffAssigned: [String] = []
    var staff: [Employee] = Model.getInstance().getStaff()
    
    

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var capacity: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var minStaffReq: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var dailyTable: UITableView!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var dailyVisitsLow: UITextView!
    @IBOutlet weak var dailyVisitsHigh: UITextView!
    @IBOutlet weak var dailyRevLow: UITextView!
    @IBOutlet weak var dailyRevRange: UITextView!
    
    @IBAction func filter(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        self.staffAssigned = event!.staffAssigned
        table.delegate = self
        table.dataSource = self
        name.text = event!.name
        price.text = "$\(event!.price)"
        startDate.text = event!.startDate
        endDate.text = event!.endDate
        minStaffReq.text = "\(String(describing: event?.minStaffRequired))"
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
