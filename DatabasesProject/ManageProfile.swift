//
//  ManageProfile.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/19/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ManageProfile: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.emails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: EmailCell = tableView.dequeueReusableCell(withIdentifier: "email", for: indexPath) as? EmailCell  else {
            fatalError("The dequeued cell is not an instance of EmailCell.")
        }
        cell.email.text = user.emails[indexPath.row]
        
        return cell
    }
    

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var empID: UILabel!
    @IBOutlet weak var siteName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var visitorAccount: UISwitch!
    
    @IBAction func add(_ sender: Any) {
        if let emailText = email.text {
            user.emails.append(emailText)
            table.reloadData()
        } else {
            //TODO: error, no email
        }
    }
    @IBAction func update(_ sender: Any) {
        Model.getInstance().updateUser(oldUser: user, newUser: user)
        //TODO: did update
    }
    
    let user: Employee = Model.getInstance().getCurrentUser() as! Employee

    override func viewDidLoad() {
        super.viewDidLoad()
        firstName.text = user.fname
        lastName.text  = user.lname
        username.text = user.username
        siteName.text = user.site?.name  ?? ""
        address.text = user.address
        phone.text = user.phone
        table.delegate = self
        table.dataSource = self
        
        
        
        
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
