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
    
    var imageNames = ["", "mobile-70", "home-depot-mobile", "home-mob", "molekule-mobile2"]
    var titles = ["Hello", "State Farm", "The Home Depot", "PayPal", "Molekule"]
    var descriptions = ["We are a design and innovation agency, creating digital products and experiences that have a lasting impact.","All things insurance, all things banking, all in one app.","The ultimate power tool: A best-in-class digital experience for The Home Depot.","Payment giant goes mobile-by-design.","The world's first intelligent air purifier, & the app putting clean air in people's hands." ]
    var logoNames = ["","4logo", "2logo", "3logo", "1logo"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        setupUI()
        configurePageControl()
    }
    
    //Setup the UI
    func setupUI(){
        collectionView.isPagingEnabled = true
        getStartedButton.layer.borderWidth = 2
        getStartedButton.layer.borderColor = UIColor.black.cgColor
    }
    
    //Setup the page control
    func configurePageControl()
    {
        pageIndicator.numberOfPages = titles.count
        pageIndicator.currentPage = 0
        pageIndicator.tintColor = UIColor.red
        pageIndicator.pageIndicatorTintColor = .gray
        pageIndicator.currentPageIndicatorTintColor = .black
        view.addSubview(pageIndicator)
    }
    
    
}


extension MainScreenVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MainScreenCell
        
        print(indexPath.row)
        print("Item \(indexPath.item)")
        if(indexPath.row == 10)
        {
            cell?.imageView.image = nil
            cell?.logo.image = nil
            cell?.titleLabel.text = titles[indexPath.row]
            cell?.descriptionLabel.text = descriptions[indexPath.row]
            cell?.titleLabel.font = UIFont.systemFont(ofSize: 18)
            print("First cell")
        }
        else
        {
            cell?.imageView.image = UIImage(named: imageNames[indexPath.row])
            cell?.titleLabel.text = titles[indexPath.row]
            cell?.titleLabel.sizeToFit()
            cell?.logo.image = UIImage(named: logoNames[indexPath.row])
            cell?.descriptionLabel.text = descriptions[indexPath.row]
        }
        
        return cell ?? MainScreenCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size // to return cell  size as same as CV
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageIndicator.currentPage = Int(pageNumber)
    }
}






