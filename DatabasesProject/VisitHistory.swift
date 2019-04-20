//
//  VisitHistory.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/19/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class VisitHistory: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sites.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        siteSelected = sites[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sites[row].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: VisitHistoryCell = tableView.dequeueReusableCell(withIdentifier: "visitHistoryInfo", for: indexPath) as? VisitHistoryCell  else {
            fatalError("The dequeued cell is not an instance of VisitHistoryCell.")
        }
        let visit = visits[indexPath.row]
        cell.date.text = visit.date
        cell.event.text = visit.event?.name
        cell.site.text = visit.siteName
        let tmp: Float = visit.event?.price ?? 0.0
        cell.price.text = "$\(String(describing: tmp))"
        return cell
    }
    
    var visits: [Visit] = []
    
    var sites: [Site] = []
    var siteSelected: Site?
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var siteName: UIPickerView!
    
    @IBAction func filter(_ sender: Any) {
        Model.getInstance().filterVisits(visitor: (Model.getInstance().getCurrentUser()), name: name.text, startDate: startDate.text, endDate: endDate.text, site: siteSelected)
        visits = Model.getInstance().getFilteredVisits()
        table.reloadData()
    }
    
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        siteName.delegate = self
        siteName.dataSource = self
        sites = Model.getInstance().getSites()
        Model.getInstance().filterVisits(visitor: (Model.getInstance().getCurrentUser()), name: nil, startDate: nil, endDate: nil, site: nil)
        visits = Model.getInstance().getFilteredVisits()
        table.reloadData()

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
