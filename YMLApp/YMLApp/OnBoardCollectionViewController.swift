//
//  OnBoardCollectionViewController.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 20/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class OnBoardCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var imageNames = ["mobile-70", "home-depot-mobile", "home-mob", "molekule-mobile2"]
    var titles = ["State Farm", "The Home Depot", "PayPal", "Molekule"]
    var descriptions = ["All things insurance, all things banking, all in one app.","The ultimate power tool: A best-in-class digital experience for The Home Depot.","Payment giant goes mobile-by-design.","The world's first intelligent air purifier, & the app putting clean air in people's hands." ]
    var logoNames = ["state-farm-logo", "thd-logo-1", "paypal-logo", "molekule"]

    override func viewDidLoad() {
        collectionView.isPagingEnabled = true
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(OnBoardCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? OnBoardCell
    
        // Configure the cell
        //cell?.backgroundColor = .orange
        //cell?.label.text = String(indexPath.row)
        cell?.imageView.image = UIImage(named: self.imageNames[indexPath.row])
        cell?.title.text = self.titles[indexPath.row]
        cell?.descriptionLabel.text = self.descriptions[indexPath.row]
        cell?.logoView.image = UIImage(named: self.logoNames[indexPath.row])
    
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size // to return cell  size as same as CV
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
//        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
