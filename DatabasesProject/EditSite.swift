//
//  EditSite.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class EditSite: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var zip: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var manager: UIPickerView!
    @IBOutlet weak var openEveryday: UISwitch!
    
    @IBAction func update(_ sender: Any) {
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
