//
//  ViewScheduleCell.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/19/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ViewScheduleCell: UITableViewCell {
    @IBOutlet weak var siteName: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var staffCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
