//
//  ViewEditEvent.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ViewEditEvent: UIViewController {

    @IBOutlet weak var name: UIScrollView!
    @IBOutlet weak var price: UIScrollView!
    @IBOutlet weak var capacity: UIScrollView!
    @IBOutlet weak var startDate: UIScrollView!
    @IBOutlet weak var endDate: UIScrollView!
    @IBOutlet weak var minStaffReq: UIScrollView!
    @IBOutlet weak var table: UIScrollView!
    @IBOutlet weak var desc: UIScrollView!
    @IBOutlet weak var dailyVisitsLow: UIScrollView!
    @IBOutlet weak var dailyVisitsHigh: UIScrollView!
    @IBOutlet weak var dailyRevLow: UIScrollView!
    @IBOutlet weak var dailyRevRange: UIScrollView!
    
    @IBAction func filter(_ sender: Any) {
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
