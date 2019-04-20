//
//  TakeTransit.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/19/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class TakeTransit: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var sites: [Site] = Model.getInstance().getSites()
    var types: [String] = Model.getInstance().getTransportTypes()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1) { // Sites
            return sites.count
        }
        if (pickerView.tag == 2) {
            return types.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1) { // Sites
            return sites[row].name
        }
        if (pickerView.tag == 2) {
            return types[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1) { // Sites
            selectedSite = sites[row]
        }
        if (pickerView.tag == 2) {
            selectedType = types[row]
        }
    }
    
    var selectedSite: Site?
    var selectedType: String?
    
    
    var transits: [Transit] = Model.getInstance().getTransits()
    var selectedTransit: Transit?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RouteCell = tableView.dequeueReusableCell(withIdentifier: "route", for: indexPath) as? RouteCell  else {
            fatalError("The dequeued cell is not an instance of RouteCell.")
        }
        let transit = transits[indexPath.row]
        cell.route.text = transit.route
        cell.transportType.text = transit.type
        cell.price.text = "\(String(describing: transit.price))"
        cell.connectedSites.text = "\(String(describing: transit.connectedSites.count))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTransit = transits[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectedTransit = nil;
    }
    

    @IBOutlet weak var containSite: UIPickerView!
    @IBOutlet weak var transportType: UIPickerView!
    @IBOutlet weak var priceLow: UITextField!
    @IBOutlet weak var priceHigh: UITextField!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var transitDate: UITextField!
    
    @IBAction func filter(_ sender: Any) {
        Model.getInstance().filterTransits(route: nil, transportType: selectedType, site: selectedSite, priceLow: nil, priceHigh: nil)
        transits = Model.getInstance().getFilteredTransits()
        table.reloadData()
    }
    
    @IBAction func logTransit(_ sender: Any) {
        print("Does this work")
        if (selectedTransit != nil && transitDate.text != nil) {
            //TODO: Validate date
            Model.getInstance().logTransit(transit: selectedTransit!, user: Model.getInstance().getCurrentUser(), date: transitDate.text!)
            //TODO: Transit Logged
        } else {
            //TODO: Error message telling them to select transit or enter date
        }
    }
    
    override func viewDidLoad() {
        containSite.delegate = self
        containSite.dataSource = self
        transportType.delegate = self
        transportType.dataSource = self
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
