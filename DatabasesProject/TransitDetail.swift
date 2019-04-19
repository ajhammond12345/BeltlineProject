//
//  TransitDetail.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class TransitDetail: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Create cell
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTransit = transitList[indexPath.row]
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return transportTypes.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return transportTypes[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Model.getInstance().filterTransits(route: nil, transportType: transportTypes[row], site: site, priceLow: nil, priceHigh: nil)
        transitList = Model.getInstance().getFilteredTransits()
        table.reloadData()
    }
    
    var transitList: [Transit] = Model.getInstance().getTransits()
    
    
    var transportTypes: [String] = Model.getInstance().getTransportTypes()
    var selectedTransit: Transit?
    var site: Site?

    @IBOutlet weak var siteLabel: UILabel!
    @IBOutlet weak var transportType: UIPickerView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var date: UITextField!
    
    @IBAction func logTransit(_ sender: Any) {
        if date.text != nil {
            Model.getInstance().logTransit(transit: selectedTransit!, user: Model.getInstance().getCurrentUser(), date: date.text!)
        }
    }
    
    override func viewDidLoad() {
        siteLabel.text = site!.name
        
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
