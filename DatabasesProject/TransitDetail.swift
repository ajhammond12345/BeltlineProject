//
//  TransitDetail.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class TransitDetail: UIViewController {

    @IBOutlet weak var site: UILabel!
    @IBOutlet weak var transportType: UIPickerView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var date: UITextField!
    
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
