//
//  NewsVC.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 23/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class NewsVC: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setNewsItems(0)
        tableView.separatorColor = .black
        
    }
    
    //View Model
    @IBAction func indexChanged(_ sender: Any) {
        viewModel.setNewsItems(segmentedControl.selectedSegmentIndex)
        tableView.reloadData()
    }
}

