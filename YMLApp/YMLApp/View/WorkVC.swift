//
//  WorkVC.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 22/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class WorkVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = WorkViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //viewModel.initialize()
        print("Work viewdidload")
    }
    
}




