//
//  MainScreen.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 21/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class MainScreen: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var getStartedButton: UIButton!

    @IBOutlet weak var pageIndicator: UIPageControl!
    
    var imageNames = ["", "mobile-70", "home-depot-mobile", "home-mob", "molekule-mobile2"]
    var titles = ["Hello", "State Farm", "The Home Depot", "PayPal", "Molekule"]
    var descriptions = ["We are a design and innovation agency, creating digital products and experiences that have a lasting impact.","All things insurance, all things banking, all in one app.","The ultimate power tool: A best-in-class digital experience for The Home Depot.","Payment giant goes mobile-by-design.","The world's first intelligent air purifier, & the app putting clean air in people's hands." ]
    var logoNames = ["","4logo", "2logo", "3logo", "1logo"]
    
    var count = 0
    
    var firstCell: UICollectionViewCell!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        setupUI()
        configurePageControl()
    }
    
    func setupUI(){
        self.collectionView.isPagingEnabled = true
        getStartedButton.layer.borderWidth = 2
        getStartedButton.layer.borderColor = UIColor.black.cgColor
        //getStartedButton.layer.cornerRadius = 10
        //getStartedButton.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        //getStartedButton.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
    }
    
    func configurePageControl()
    {
        self.pageIndicator.numberOfPages = titles.count
        self.pageIndicator.currentPage = 0
        self.pageIndicator.tintColor = UIColor.red
        self.pageIndicator.pageIndicatorTintColor = .gray
        self.pageIndicator.currentPageIndicatorTintColor = .black
        self.view.addSubview(pageIndicator)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MainScreenCell
        
        
        cell?.imageView.image = UIImage(named: imageNames[indexPath.row])
        cell?.titleLabel.text = titles[indexPath.row]
        cell?.titleLabel.sizeToFit()
        //cell?.titleLabel.font = UIFont(name: "sailecbold", size: 24.0)
        cell?.logo.image = UIImage(named: logoNames[indexPath.row])
        cell?.descriptionLabel.text = descriptions[indexPath.row]
        //cell?.descriptionLabel.sizeToFit()
//        if(count == 0){
//            cell?.titleLabel.font = UIFont.systemFont(ofSize: 34)
//            count = 1
//        }
        
        return cell ?? MainScreenCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Index \(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size // to return cell  size as same as CV
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageIndicator.currentPage = Int(pageNumber)
        print(scrollView.contentOffset.x)
    }
    
    
    
				    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
