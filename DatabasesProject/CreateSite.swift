//
//  CreateSite.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class CreateSite: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return managers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedManager = managers[row]
    }
    
    
    var managers: [Employee] = []
    var selectedManager: Employee?

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var zip: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var manager: UIPickerView!
    @IBOutlet weak var openEveryday: UISwitch!
    
    @IBAction func create(_ sender: Any) {
        if name.text != nil && zip.text != nil && address.text != nil && selectedManager != nil {
            let newSite: Site = Site(name: name.text!, zip: zip.text!, address: address.text!, managerUsername: selectedManager!.username, openEveryday: openEveryday.isOn)
            Model.getInstance().createSite(site: newSite)
            performSegue(withIdentifier: "create_site_to_manage_site", sender: self)
        }
    }
    
    override func viewDidLoad() {
        manager.delegate = self
        manager.dataSource = self
        managers = Model.getInstance().getManagers()
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
