//
//  MainScreen.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 21/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class MainScreenVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var getStartedButton: UIButton!

    @IBOutlet weak var pageIndicator: UIPageControl!
    
    var viewModel = MainScreenViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewModel.initialize()
        setupUI()
        configurePageControl()
    }
    
    //Setup the UI
    func setupUI(){
        collectionView.isPagingEnabled = true
        getStartedButton.layer.borderWidth = 2
        getStartedButton.layer.borderColor = UIColor.gray.cgColor
    }
    
    //Setup the page control
    func configurePageControl(){
        pageIndicator.numberOfPages = viewModel.products.count
        pageIndicator.currentPage = 0
        pageIndicator.tintColor = UIColor.red
        pageIndicator.pageIndicatorTintColor = .gray
        pageIndicator.currentPageIndicatorTintColor = .black
        view.addSubview(pageIndicator)
    }
    
}



