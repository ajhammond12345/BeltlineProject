//
//  Navigation.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/16/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class Navigation: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let usertype = model.getUserType()
        
        /*
         User Types:
         0: User
         1: Visitor
         2: Admin
         3: Manager
         4: Staff
         5: Admin-Visitor
         6: Manager-Visitor
         7: Staff-Visitor
         */
        
        switch usertype {
        case 0:
            performSegue(withIdentifier: "to_user", sender: self)
        case 1:
            performSegue(withIdentifier: "to_visitor", sender: self)
        case 2:
            performSegue(withIdentifier: "to_administrator", sender: self)
        case 3:
            performSegue(withIdentifier: "to_manager", sender: self)
        case 4:
            performSegue(withIdentifier: "to_staff", sender: self)
        case 5:
            performSegue(withIdentifier: "to_admin_visitor", sender: self)
        case 6:
            performSegue(withIdentifier: "to_manager_visitor", sender: self)
        case 7:
            performSegue(withIdentifier: "to_staff_visitor", sender: self)
        default:
            performSegue(withIdentifier: "to_user", sender: self)
        }

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
