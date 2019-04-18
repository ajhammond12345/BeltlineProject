//
//  Login.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/16/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class Login: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    

    @IBAction func login(_ sender: Any) {
        if let emailText = email.text {
            if let passwordText = password.text {
                if Model.getInstance().login(email: emailText, password: passwordText) {
                    performSegue(withIdentifier: "login_to_nav", sender: self)
                } else {
                    //TODO login failed
                }
                
            } else {
                //TODO missing password
            }
        } else {
            //TODO missing email
        }
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
