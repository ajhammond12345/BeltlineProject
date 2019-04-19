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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO create cells
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        siteSelected = filteredSites[indexPath.row]
    }
    
    
    var sites: [Site] = []
    var siteSelectedPicker: Site?
    
    var filteredSites: [Site] = []
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
    }
    @IBAction func transitDetail(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //TODO
        /* if segue.destination is TransitDetail {
         let dest = segue.destination as? TransitDetail
         dest?.site = siteSelected
         
         }
         if segue.destination is SiteDetail {
         let dest = segue.destination as? SiteDetail
         dest?.site = siteSelected
         
         }
         */
    }
    
    override func viewDidLoad() {
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
