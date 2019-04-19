//
//  ManageSiteCell.swift
//  DatabasesProject
//
//  Created by Cole Kibler on 4/19/19.
//  Copyright © 2019 Team24. All rights reserved.
//

import UIKit

class ManageSiteCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var manager: UILabel!
    @IBOutlet weak var openEveryday: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
