//
//  ManageTransit.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ManageTransit: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var transportTypes: [String] = []
    var selectedTransport: String?
    var sites: [Site] = []
    var selectedSite: Site?
    var transits: [Transit] = []
    var selectedTransit: Transit?
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 { // transport types
            return transportTypes.count
        } else {
            return sites.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Create cell
        return UITableViewCell()
    }
    
    
    

    @IBOutlet weak var route: UITextField!
    @IBOutlet weak var transporttype: UIPickerView!
    @IBOutlet weak var containsite: UIPickerView!
    @IBOutlet weak var pricelow: UITextField!
    @IBOutlet weak var pricehigh: UITextField!
    
    @IBAction func filter(_ sender: Any) {
        if pricelow.text != nil || pricehigh.text != nil {
            
        }
        Model.getInstance().filterTransits(route: route.text, transportType: selectedTransport, site: selectedSite, priceLow: pricelow!.text, priceHigh: pricehigh!.text)
            
        transits = Model.getInstance().getFilteredTransits()
        table.reloadData()

    }

    @IBOutlet weak var table: UITableView!
    
    @IBAction func create(_ sender: Any) {
    }
    @IBAction func edit(_ sender: Any) {
        performSegue(withIdentifier: "manage_to_edit_transit", sender: self)
    }
    @IBAction func deletebutton(_ sender: Any) {
        print("Deleting Transit")
        if (selectedTransit != nil) {
            Model.getInstance().deleteTransit(transit: selectedTransit!)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //TODO
       /* if segue.destination is EditTransit {
            let dest = segue.destination as? EditTransit
            dest?.transit = selectedTransit
        }*/
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
