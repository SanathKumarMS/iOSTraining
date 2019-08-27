//
//  CareersVC-Extension+TableViewDataSource.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation
import UIKit

extension CareersVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.jsonItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CareersVCCell.self)) as? CareersVCCell
        //cell?.backgroundColor = .lightGray
        cell?.domainLabel.text = viewModel.jsonItems[indexPath.row].domain
        cell?.domainLabel.font = UIFont.systemFont(ofSize: 18)
        cell?.domainLabel.textColor = .lightGray
        cell?.positionLabel.text = viewModel.jsonItems[indexPath.row].position
        cell?.positionLabel.font = UIFont.systemFont(ofSize: 28)
        cell?.locationLabel.text = viewModel.jsonItems[indexPath.row].location
        cell?.locationLabel.font = UIFont.systemFont(ofSize: 20)
        
        return cell ?? CareersVCCell()
    }
}

