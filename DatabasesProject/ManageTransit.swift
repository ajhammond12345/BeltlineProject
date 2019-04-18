//
//  ManageTransit.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ManageTransit: UIViewController {

    @IBOutlet weak var route: UITextField!
    @IBOutlet weak var transporttype: UIPickerView!
    @IBOutlet weak var containsite: UIPickerView!
    @IBOutlet weak var pricelow: UITextField!
    @IBOutlet weak var pricehigh: UITextField!
    
    @IBAction func filter(_ sender: Any) {
    }

    @IBOutlet weak var table: UITableView!
    
    @IBAction func create(_ sender: Any) {
    }
    @IBAction func edit(_ sender: Any) {
    }
    @IBAction func deletebutton(_ sender: Any) {
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
