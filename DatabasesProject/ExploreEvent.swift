//
//  ExploreEvent.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ExploreEvent: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var keyword: UITextField!
    @IBOutlet weak var startdate: UITextField!
    @IBOutlet weak var enddate: UITextField!
    @IBOutlet weak var sitename: UIPickerView!
    @IBOutlet weak var visitslow: UITextField!
    @IBOutlet weak var visitshigh: UITextField!
    @IBOutlet weak var ticketPriceLow: UITextField!
    @IBOutlet weak var ticketPriceHigh: UITextField!
    
    @IBAction func filter(_ sender: Any) {
    }
    @IBOutlet weak var table: UITableView!
    @IBAction func create(_ sender: Any) {
    }
    @IBAction func eventDetail(_ sender: Any) {
    }
    @IBAction func deleteButton(_ sender: Any) {
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
