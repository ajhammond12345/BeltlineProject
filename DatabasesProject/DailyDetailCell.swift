//
//  DailyDetailCell.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/19/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class DailyDetailCell: UITableViewCell {

    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var staffNames: UILabel!
    @IBOutlet weak var visits: UILabel!
    @IBOutlet weak var revenue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
