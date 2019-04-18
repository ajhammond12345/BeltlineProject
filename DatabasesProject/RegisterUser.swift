//
//  RegisterUser.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/16/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class RegisterUser: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var emailList: [String] = []
    @IBOutlet weak var emails: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "email", for: indexPath) as? EmailCell  else {
            fatalError("The dequeued cell is not an instance of EmailCell.")
        }
        let i = emailList[indexPath.row]
        cell.email.text = i
        return cell
    }
    
    @IBOutlet weak var email: UITextField!
    @IBAction func addEmail(_ sender: Any) {
        if let emailText = email.text {
            emailList.append(emailText)
            emails.reloadData()
        } else {
            //TODO: error, no email
        }
        
    }
    

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBAction func register(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emails.delegate = self
        emails.dataSource = self
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
