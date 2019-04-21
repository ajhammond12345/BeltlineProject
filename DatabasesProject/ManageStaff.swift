//
//  ManageStaff.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ManageStaff: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staff.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ManageStaffCell = tableView.dequeueReusableCell(withIdentifier: "manageStaffInfo", for: indexPath) as? ManageStaffCell else {
            fatalError("The dequeued cell is not an instance of manageStaffInfo.")
        }
        cell.staffName.text = staff[indexPath.row].fname + staff[indexPath.row].lname
        cell.numEventShifts.text = staff[indexPath.row].
        
        return cell

    }
    
    
    var staff: [Employee] = []

    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var startdate: UITextField!
    @IBOutlet weak var enddate: UITextField!
    @IBOutlet weak var site: UIPickerView!
    
    @IBAction func filter(_ sender: Any) {
        Model.getInstance().filterStaff(fname: fname.text, lname: lname.text, startDate: startdate.text, endDate: enddate.text)
        staff = Model.getInstance().getStaff()
        table.reloadData()
    }
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        staff = Model.getInstance().getStaff()
        table.delegate = self
        table.dataSource = self

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
