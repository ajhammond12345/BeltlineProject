//
//  ManagerUser.swift
//  DatabasesProject
//
//  Created by Alexander Hammond on 4/18/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ManagerUser: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Create cell
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = userList[indexPath.row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return typeList.count
        } else {
            return statusList.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return typeList[row]
        } else {
            return statusList[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            selectedType = row - 1
        } else {
            if (row != 0) {
                selectedStatus = statusList[row]
            }
        }
    }
    
    var userList: [User] = []
    var selectedUser: User?
    
    var selectedType: Int?
    var selectedStatus: String?
    
    var typeList: [String] =  Model.getInstance().getUserTypes()
    var statusList: [String] = Model.getInstance().getUserStatuses()

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var type: UIPickerView!
    @IBOutlet weak var status: UIPickerView!
    
    @IBOutlet weak var table: UITableView!
    
    @IBAction func filter(_ sender: Any) {
        Model.getInstance().filterUsers(username: username.text, type: selectedType, status: selectedStatus)
        userList = Model.getInstance().getFilteredUserList()
        table.reloadData()
    }
    
    @IBAction func decline(_ sender: Any) {
        if (selectedUser != nil) {
            Model.getInstance().declineUser(user: selectedUser!)
        }
    }
    
    @IBAction func approve(_ sender: Any) {
        if (selectedUser != nil) {
            Model.getInstance().acceptUser(user: selectedUser!)
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
