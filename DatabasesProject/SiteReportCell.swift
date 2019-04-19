
//
//  SiteReportCell.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/19/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class SiteReportCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var eventCount: UILabel!
    @IBOutlet weak var staffCount: UILabel!
    @IBOutlet weak var totalVisits: UILabel!
    @IBOutlet weak var totalRevenue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
