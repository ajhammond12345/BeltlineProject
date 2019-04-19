//
//  TakeTransit.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/19/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class TakeTransit: UIViewController {

    @IBOutlet weak var containSite: UIPickerView!
    @IBOutlet weak var transportType: UIPickerView!
    @IBOutlet weak var priceLow: UITextField!
    @IBOutlet weak var priceHigh: UITextField!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var transitDate: UITextField!
    
    @IBAction func filter(_ sender: Any) {
    }
    @IBAction func logTransit(_ sender: Any) {
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
