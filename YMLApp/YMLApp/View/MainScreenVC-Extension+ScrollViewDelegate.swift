//
//  MainScreenVC-Extension+ScrollViewDelegate.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

extension MainScreenVC: UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageIndicator.currentPage = Int(pageNumber)
    }
}
