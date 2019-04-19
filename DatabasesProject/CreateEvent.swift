//
//  CreateEvent.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class CreateEvent: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staff.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO Create cell
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        staffAssigned.append(staff[indexPath.row].username)
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
    
    
    var staffAssigned: [String] = []
    var staff: [Employee] = Model.getInstance().getStaff()
    

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var capacity: UITextField!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var minStaffReq: UITextField!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var desc: UITextView!
    
    @IBAction func create(_ sender: Any) {
        if (name.text != nil && price.text != nil && capacity.text != nil && startDate.text != nil && endDate.text != nil && minStaffReq.text != nil && desc.text != nil) {
            let priceVal: Float? = Float(price.text!)
            let capacityVal: Int? = Int(capacity.text!)
            let minStaffVal: Int? = Int(minStaffReq.text!)
            
            if (priceVal != nil && capacityVal != nil && minStaffVal != nil) {
                let newEvent = Event(name: name.text!, price: priceVal!, capacity: capacityVal!, startDate: startDate.text!, endDate: endDate.text!, minStaffRequired: minStaffVal!, staffAssigned: staffAssigned, descript: desc.text!, siteName: (Model.getInstance().getCurrentUser() as! Employee).getSite()!.name)
                Model.getInstance().createEvent(event: newEvent)
                performSegue(withIdentifier: "create_event_to_manage_event", sender: self)
            }
        }
    }
    
    override func viewDidLoad() {
        table.delegate = self
        table.dataSource = self
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
