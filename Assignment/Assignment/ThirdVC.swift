//
//  ThirdVC.swift
//  Assignment
//
//  Created by Sanath Kumar M S on 09/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {
    
    var text : String = ""
    
    @IBOutlet weak var displayName: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        displayName.text = text
    }

    


}
