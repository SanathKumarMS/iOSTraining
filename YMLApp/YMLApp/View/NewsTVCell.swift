//
//  NewsTVCell.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 23/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class NewsTVCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsCategory: UILabel!
    @IBOutlet weak var newsDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
