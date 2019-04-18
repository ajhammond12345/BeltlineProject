//
//  SiteReport.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class SiteReport: UIViewController {

    @IBOutlet weak var startdate: UITextField!
    @IBOutlet weak var enddate: UITextField!
    @IBOutlet weak var staffcountlow: UITextField!
    @IBOutlet weak var staffcounthigh: UITextField!
    @IBOutlet weak var eventcountlow: UITextField!
    @IBOutlet weak var eventcounthigh: UITextField!
    @IBOutlet weak var totalvisitslow: UITextField!
    @IBOutlet weak var totalvisitshigh: UITextField!
    @IBOutlet weak var totalrevlow: UITextField!
    @IBOutlet weak var totalrevhigh: UITextField!
    
    @IBAction func filter(_ sender: Any) {
    }
    
    @IBOutlet weak var table: UITableView!
    
    @IBAction func dailydetail(_ sender: Any) {
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
