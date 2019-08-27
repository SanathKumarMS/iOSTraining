//
//  WorkVC-Extension+TableViewDataSource.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation
import UIKit

extension WorkVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.noOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkCell", for: indexPath) as? WorkTVCell
        
        cell?.backgroundColor = .white
        cell?.workImageView?.image = UIImage(named: viewModel.workProducts[indexPath.row].image)
        cell?.workTitle.text = viewModel.workProducts[indexPath.row].title
        cell?.workTitle.textColor = UIColor.lightGray
        cell?.workTitle.font = UIFont.boldSystemFont(ofSize: 20)
        cell?.workDescription.text = viewModel.workProducts[indexPath.row].description
        cell?.workDescription.font = UIFont.systemFont(ofSize: 40)
        cell?.selectionStyle = .none
        return cell ?? WorkTVCell()
    }
}
