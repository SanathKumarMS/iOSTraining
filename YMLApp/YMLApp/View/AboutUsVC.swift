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
    var viewModel = AboutUsVM()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension AboutUsVC: UICollectionViewDelegate{
    
}

extension AboutUsVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.aboutItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AboutUsCVCell.self), for: indexPath) as? AboutUsCVCell
        {
//            if indexPath.row % 2 == 0{
//                cell.backgroundColor = .red
//            }
//            else
//            {
//                cell.backgroundColor = .gray
//            }
            cell.imageView.image = UIImage(named: viewModel.aboutItems[indexPath.row].image)
            return cell
        }
        return AboutUsCVCell()
    }
    
    
}
