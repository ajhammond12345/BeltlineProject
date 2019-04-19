//
//  ManageUserCell.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/19/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ManageUserCell: UITableViewCell {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var numEmails: UILabel!
    @IBOutlet weak var userType: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
