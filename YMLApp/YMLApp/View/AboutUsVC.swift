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
    
    @IBOutlet weak var gridCollectionView: UICollectionView!
    
    var viewModel = AboutUsVM()
    let itemsPerRow: CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 20.0,
                                             left: 20.0,
                                             bottom: 20.0,
                                             right: 20.0)

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
        pageController.currentPageIndicatorTintColor = .green
        view.addSubview(pageController)
    }
    
    
}

extension AboutUsVC: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}

extension AboutUsVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView{
            return viewModel.aboutItems.count
        }
        else{
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AboutUsCVCell.self), for: indexPath) as? AboutUsCVCell
            {
                cell.imageView.image = UIImage(named: viewModel.aboutItems[indexPath.row].image)
                return cell
            }
            return AboutUsCVCell()
        }
        else{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AboutUsCVGridCell.self), for: indexPath) as? AboutUsCVGridCell
            {
                //cell.backgroundColor = .gray
                cell.button.setTitle(viewModel.gridItems[indexPath.row].name, for: .normal)
                return cell
            }
            return AboutUsCVGridCell()
        }
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


extension AboutUsVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == gridCollectionView{
            let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
            let availableWidth = view.frame.width - paddingSpace
            let widthPerItem = availableWidth / itemsPerRow
            print(widthPerItem)
            //return CGSize(width: widthPerItem, height: widthPerItem)
            return CGSize(width: 140, height: 140)
        }
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if collectionView == gridCollectionView{
//            return sectionInsets
//        }
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == gridCollectionView{
            return sectionInsets.left
        }
        return CGFloat(0)
    }
}
