//
//  NewsVC-Extension+TableViewDataSource.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation
import UIKit

extension NewsVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: "NewsTVCell"), for: indexPath) as? NewsTVCell
        
        cell?.newsImageView.image = UIImage(named: viewModel.newsItems[indexPath.row].image)
        cell?.newsCategory.text = viewModel.newsItems[indexPath.row].category.uppercased()
        cell?.newsCategory.textColor = UIColor.lightGray
        cell?.newsDescription.text = viewModel.newsItems[indexPath.row].description
        cell?.newsDescription.font = UIFont.systemFont(ofSize: 40)
        cell?.newsDescription.adjustsFontSizeToFitWidth = true
        return cell ?? NewsTVCell()
    }
    
}
