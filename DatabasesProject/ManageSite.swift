//
//  ManageSite.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ManageSite: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var filteredSites: [Site] = []
    var selectedSite: Site? //site selected in the table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Site Cell
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSite = filteredSites[indexPath.row]
    }
    
    
    var managers: [Employee] = []
    var managerSelected: Employee?
    
    var sites: [Site] = []
    var siteSelected: Site?
    
    var selectedSites: [Site] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 { //manager
            return managers.count
        } else {
            return sites.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1) {
            managerSelected = managers[row]
        } else {
            siteSelected = sites[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1) {
            return "\(managers[row].fname) \(managers[row].lname)"
        } else {
            return sites[row].name
        }
    }
    

    @IBOutlet weak var openeveryday: UISwitch!
    @IBOutlet weak var manager: UIPickerView!
    @IBOutlet weak var site: UIPickerView!
    @IBAction func filter(_ sender: Any) {
        var open = false;
        if (openeveryday.isOn) {
            open = true;
        }
        Model.getInstance().filterSites(open: open, manager: managerSelected, site: siteSelected)
        //TODO: potentially display waiting symbol
        filteredSites = Model.getInstance().getFilteredSites()
        table.reloadData()
        
    }
    @IBOutlet weak var table: UITableView!
    @IBAction func create(_ sender: Any) {
        
    }
    @IBAction func edit(_ sender: Any) {
        performSegue(withIdentifier: "manage_to_edit_site", sender: self)
    }
    @IBAction func deletebutton(_ sender: Any) {
        if (selectedSite != nil) {
            Model.getInstance().deleteSite(site: selectedSite!)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //TODO
        if segue.destination is EditSite {
         let dest = segue.destination as? EditSite
         dest?.site = selectedSite
         }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.dataSource = self
        site.dataSource = self
        site.delegate = self
        sites = Model.getInstance().getSites()
        filteredSites = Model.getInstance().getSites()
        managers = Model.getInstance().getManagers()

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
