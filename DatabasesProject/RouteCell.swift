//
//  RouteCell.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/19/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class RouteCell: UITableViewCell {

    @IBOutlet weak var route: UILabel!
    @IBOutlet weak var transportType: UILabel!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var numConnectedSites: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
