//
//  CareersVCCell.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 26/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class CareersVCCell: UITableViewCell {
    
    @IBOutlet weak var domainLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
