//
//  ExploreSiteCell.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/19/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ExploreSiteCell: UITableViewCell {

    @IBOutlet weak var siteName: UILabel!
    @IBOutlet weak var eventCount: UILabel!
    @IBOutlet weak var totalVisits: UILabel!
    @IBOutlet weak var myVisits: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
