//
//  CreateTransit.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class CreateTransit: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var typeSelected: String?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Model.getInstance().getTransportTypes().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Model.getInstance().getTransportTypes()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeSelected = Model.getInstance().getTransportTypes()[row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ConnectedSites = tableView.dequeueReusableCell(withIdentifier: "connectedSites", for: indexPath) as? ConnectedSites else {
            fatalError("The dequeued cell is not an instance of ConnectedSites.")
        }
        cell.connectedSites.text = sites[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSites.append(sites[indexPath.row].name)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let deselected = sites[indexPath.row].name
        var i: Int = 0
        var index: Int = -1
        for site in selectedSites {
            if site == deselected {
                index = i
            }
            i += 1
        }
        selectedSites.remove(at: index)
    }
    
    var transportTypes: [String] = Model.getInstance().getTransportTypes()
    var selectedType: String?
    
    var selectedSites: [String] = []
    var sites: [Site] = Model.getInstance().getSites()

    @IBOutlet weak var transportType: UIPickerView!
    @IBOutlet weak var route: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var table: UITableView!
    
    @IBAction func create(_ sender: Any) {
        if selectedType != nil && route.text != nil && price.text != nil && selectedSites.count > 0 {
            let priceVal: Float? = Float(price.text!)
            if (priceVal != nil) {
                let newTransit: Transit = Transit(type: selectedType!, route: route.text!, price: priceVal!, connectedSites: selectedSites)
                Model.getInstance().createTransit(transit: newTransit)
                performSegue(withIdentifier: "create_transit_to_manage_transit", sender: self)
            } else {
                //TODO: Invalid price
            }
        } else {
            // TODO: Missing Info
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
