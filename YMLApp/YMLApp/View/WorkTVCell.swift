//
//  WorkTVCell.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 22/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class WorkTVCell: UITableViewCell {
    
    @IBOutlet weak var workImageView: UIImageView!
    @IBOutlet weak var workTitle: UILabel!
    @IBOutlet weak var workDescription: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
