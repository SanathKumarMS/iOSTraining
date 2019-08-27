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
        viewModel.getFeatured()
        tableView.separatorColor = .black
        
    }
    
    //View Model
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0: viewModel.getFeatured()
        case 1: viewModel.getDesign()
        case 2: viewModel.getEbooks()
        default: break
        }
        tableView.reloadData()
    }
}

