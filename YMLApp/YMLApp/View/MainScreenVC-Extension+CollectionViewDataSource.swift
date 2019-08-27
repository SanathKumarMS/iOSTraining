//
//  MainScreenVC-Extension+CollectionViewDataSource.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//


import UIKit

extension MainScreenVC: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainScreenCell", for: indexPath) as? MainScreenCell
        
        print(indexPath.row)
        print("Item \(indexPath.item)")
        cell?.imageView.image = UIImage(named: viewModel.products[indexPath.row].imageName)
        cell?.titleLabel.text = viewModel.products[indexPath.row].title
        cell?.titleLabel.sizeToFit()
        cell?.logo.image = UIImage(named: viewModel.products[indexPath.row].logoName)
        cell?.descriptionLabel.text = viewModel.products[indexPath.row].description
        //cell?.titleLabel.font = UIFont.systemFont(ofSize: 30)
        
        if(indexPath.row == 0)
        {
            cell?.imageView.image = nil
            cell?.logo.image = nil
            cell?.titleLabel.text = viewModel.products[indexPath.row].title
            cell?.descriptionLabel.text = viewModel.products[indexPath.row].description
            cell?.titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
            print("First cell")
        }
        
        return cell ?? MainScreenCell()
    }
}
