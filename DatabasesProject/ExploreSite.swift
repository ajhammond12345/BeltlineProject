//
//  ExploreSite.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ExploreSite: UIViewController {

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
    }
    @IBOutlet weak var table: UITableView!
    @IBAction func siteDetail(_ sender: Any) {
    }
    @IBAction func transitDetail(_ sender: Any) {
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
