//
//  AboutUsVC.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 29/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class AboutUsVC: BaseVC {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageController: UIPageControl!
    
    var viewModel = AboutUsVM()


    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControl()
    }
    
    @IBAction func rightArrowButton(_ sender: Any) {
        let contentOffset = floor(collectionView.contentOffset.x + collectionView.bounds.width)
        //print(contentOffset)
        moveToPosition(contentOffset: contentOffset)
    }
    
    @IBAction func leftArrowButton(_ sender: Any) {
        let contentOffset = floor(collectionView.contentOffset.x - collectionView.bounds.width)
        //print(contentOffset)
        moveToPosition(contentOffset: contentOffset)
    }
    
    func moveToPosition(contentOffset: CGFloat){
        let frame = CGRect(x: contentOffset, y: 0, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
        self.collectionView.scrollRectToVisible(frame, animated: true)
//        print(collectionView.contentOffset.x)
//        print(collectionView.frame.size.width)
//        print(collectionView.bounds.width)
        let pageNumber = round(contentOffset/(collectionView.frame.size.width))
        pageController.currentPage = Int(pageNumber)
    }
    
    func configurePageControl(){
        pageController.numberOfPages = viewModel.aboutItems.count
        pageController.currentPage = 0
        pageController.tintColor = UIColor.red
        pageController.pageIndicatorTintColor = .gray
        pageController.currentPageIndicatorTintColor = .black
        view.addSubview(pageController)
    }
    
    
}

extension AboutUsVC: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}

extension AboutUsVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.aboutItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AboutUsCVCell.self), for: indexPath) as? AboutUsCVCell
        {
            cell.imageView.image = UIImage(named: viewModel.aboutItems[indexPath.row].image)
            return cell
        }
        return AboutUsCVCell()
    }
    
}

extension AboutUsVC: UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x/(scrollView.frame.width))
        print(scrollView.contentOffset.x)
        print(scrollView.frame.width)
        pageController.currentPage = Int(pageNumber)
    }
    
    func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x/(scrollView.frame.width))
        print(scrollView.contentOffset.x)
        print(scrollView.frame.width)
        pageController.currentPage = Int(pageNumber)
    }
}
