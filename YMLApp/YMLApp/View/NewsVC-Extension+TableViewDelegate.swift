//
//  NewsVC-Extension+TableViewDelegate.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation
import UIKit

extension NewsVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let webViewVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: WebViewVC.self)) as? WebViewVC
        {
            webViewVC.url = URL(string: viewModel.newsItems[indexPath.row].url)
            self.navigationController?.pushViewController(webViewVC, animated: true)
        }
    }
}
