//
//  ExploreSite.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ExploreSite: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sites.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        siteSelectedPicker = sites[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sites[row].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ExploreSiteCell = tableView.dequeueReusableCell(withIdentifier: "site_cell", for: indexPath) as? ExploreSiteCell  else {
            fatalError("The dequeued cell is not an instance of ExploreSiteCell.")
        }
        let site = sites[indexPath.row]
        cell.siteName.text = site.name
        cell.eventCount.text = "$\(String(describing: site.eventCount ?? 0))"
        cell.totalVisits.text = "$\(String(describing: site.totalVisits ?? 0))"
        cell.myVisits.text = "$\(String(describing: site.myVisits ?? 0))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        siteSelected = filteredSites[indexPath.row]
    }
    
    
    var sites: [Site] = Model.getInstance().getSites()
    var siteSelectedPicker: Site?
    
    var filteredSites: [Site] = Model.getInstance().getExploreFilteredSites()
    var siteSelected: Site?

    @IBOutlet weak var siteName: UIPickerView!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var openEveryday: UISwitch!
    @IBOutlet weak var includeVisited: UISwitch!
    @IBOutlet weak var visitsLow: UITextField!
    @IBOutlet weak var visitsHigh: UITextField!
    @IBOutlet weak var eventCountLow: UITextField!
    @IBOutlet weak var eventsCountHigh: UITextField!
    
    @IBAction func filter(_ sender: Any) {
        Model.getInstance().exploreSites(site: siteSelectedPicker, startDate: startDate.text, endDate: endDate.text, openEveryday: openEveryday.isOn, includeVisited: includeVisited.isOn, visitsLow: visitsLow.text, visitsHigh: visitsHigh.text, eventCountLow: eventCountLow.text, eventCountHigh: eventsCountHigh.text)
        //TODO: potentially display waiting symbol
        filteredSites = Model.getInstance().getExploreFilteredSites()
        table.reloadData()
    }
    @IBOutlet weak var table: UITableView!
    @IBAction func siteDetail(_ sender: Any) {
        if siteSelected != nil {
            performSegue(withIdentifier: "to_site_detail", sender: self)
        }
    }
    @IBAction func transitDetail(_ sender: Any) {
        if siteSelected != nil {
            performSegue(withIdentifier: "to_transit_detail", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.destination is TransitDetail {
            let dest = segue.destination as? TransitDetail
            dest?.site = siteSelected
         }
         if segue.destination is SiteDetail {
            let dest = segue.destination as? SiteDetail
            dest?.site = siteSelected
         }
    }
    
    override func viewDidLoad() {
        Model.getInstance().exploreSites(site: nil, startDate: nil, endDate: nil, openEveryday: false, includeVisited: true, visitsLow: nil, visitsHigh: nil, eventCountLow: nil, eventCountHigh: nil)
        filteredSites = Model.getInstance().getExploreFilteredSites()
        siteName.dataSource = self
        siteName.delegate = self
        table.dataSource = self
        table.delegate = self
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
