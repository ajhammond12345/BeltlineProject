//
//  SiteDetail.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class SiteDetail: UIViewController {
    
    var site: Site?

    @IBOutlet weak var siteName: UILabel!
    @IBOutlet weak var openEveryday: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var date: UITextField!
    
    @IBAction func logVisit(_ sender: Any) {
        if date.text != nil {
            let visit: Visit = Visit(siteName: site!.name, username: Model.getInstance().getCurrentUser().username, date: date.text!)
            Model.getInstance().logVisit(visit: visit)
        }
    }
    
    override func viewDidLoad() {
        siteName.text = site!.name
        var openEverydayText: String = ""
        if (site!.openEveryday) {
            openEverydayText = "True"
        } else {
            openEverydayText = "False"
        }
        openEveryday.text = openEverydayText
        address.text = site?.address
        
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
