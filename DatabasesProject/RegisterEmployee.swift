//
//  RegisterEmployee.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/16/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class RegisterEmployee: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let employeeType = Utility.employeeTypes
    var utype: Int = -1
    
    let states = Utility.states
    var st: Int = -1
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 1 { //user type
            return 1
        }
        if pickerView.tag == 2 { //states
            return 1
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 { //user type
            return employeeType.count
        }
        if pickerView.tag == 2 { //states
            return states.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 { //user type
            utype = row
        }
        if pickerView.tag == 2 { //states
            st = row
        }
    }
    
    
    
    
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
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var userType: UIPickerView!
    @IBOutlet weak var state: UIPickerView!
    
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var zip: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBAction func register(_ sender: Any) {
        if let first = firstName.text, let last = lastName.text, let uname = username.text, let phoneNum = phone.text, let addr = address.text, let cit = city.text, let zp = zip.text {
            
            if st != -1 && utype != -1 {
                let user: Employee = Employee(first: first, last: last, uname: uname, emailAddr: emailList, phoneNum: phoneNum, addr: addr, cit: cit, st: states[st], zp: zp, utype: utype)
                if let pass = password.text, let conf = confirmPassword.text {
                    if pass.elementsEqual(conf) {
                        if (Model.getInstance().register(user: user, password: pass)) {
                            performSegue(withIdentifier: "register_employee_to_nav", sender: self)
                        }
                    } else {
                        //TODO pass dont match
                    }
                } else {
                    //TODO missing password
                }
            } else {
                //TODO did not select utype or state
            }
        } else {
            //TODO Missing information
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emails.delegate = self
        emails.dataSource = self
        
        state.delegate = self
        state.dataSource = self
        
        userType.delegate = self
        userType.dataSource = self
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
