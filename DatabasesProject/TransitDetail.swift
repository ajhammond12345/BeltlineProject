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
        guard let cell: TransitDetailCell = tableView.dequeueReusableCell(withIdentifier: "transitDetailInfo", for: indexPath) as? TransitDetailCell  else {
            fatalError("The dequeued cell is not an instance of VisitHistoryCell.")
        }
        let transit = transitList[indexPath.row]
        cell.route.text = transit.route
        cell.transportType.text = transit.type
        cell.price.text = String(describing: transit.price)
        cell.numConnectedSites.text = String(describing: transit.connectedSites.count)
        return cell
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
    
    var transitList: [Transit] = Model.getInstance().getFilteredTransits()
    
    
    var transportTypes: [String] = Model.getInstance().getTransportTypes()
    var selectedTransit: Transit?
    var site: Site?

    @IBOutlet weak var siteLabel: UILabel!
    @IBOutlet weak var transportType: UIPickerView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var date: UITextField!
    
    @IBAction func logTransit(_ sender: Any) {
        //TODO: Validate date
        if date.text != nil && selectedTransit != nil {
            Model.getInstance().logTransit(transit: selectedTransit!, user: Model.getInstance().getCurrentUser(), date: date.text!)
        }
    }
    
    override func viewDidLoad() {
        Model.getInstance().filterTransits(route: nil, transportType: nil, site: site, priceLow: nil, priceHigh: nil)
        transitList = Model.getInstance().getFilteredTransits()
        table.reloadData()
        siteLabel.text = site!.name
        transportType.delegate = self
        transportType.dataSource = self
        table.delegate = self
        table.dataSource = self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Model.getInstance().filterTransits(route: nil, transportType: nil, site: site, priceLow: nil, priceHigh: nil)
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
