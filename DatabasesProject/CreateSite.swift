//
//  CreateSite.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class CreateSite: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var zip: UITextField!
    @IBOutlet weak var address: UIPickerView!
    @IBOutlet weak var manager: UIPickerView!
    @IBOutlet weak var openEveryday: UISwitch!
    
    @IBAction func create(_ sender: Any) {
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
