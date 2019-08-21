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
    
    var imageNames = ["", "mobile-70", "home-depot-mobile", "home-mob", "molekule-mobile2"]
    var titles = ["Hello", "State Farm", "The Home Depot", "PayPal", "Molekule"]
    var descriptions = ["We are a design and innovation agency, creating digital products and experiences that have a lasting impact.","All things insurance, all things banking, all in one app.","The ultimate power tool: A best-in-class digital experience for The Home Depot.","Payment giant goes mobile-by-design.","The world's first intelligent air purifier, & the app putting clean air in people's hands." ]
    var logoNames = ["","state-farm-logo", "thd-logo-1", "paypal-logo", "molekule"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        self.collectionView.isPagingEnabled = true
        getStartedButton.layer.borderWidth = 2
        getStartedButton.layer.borderColor = UIColor.black.cgColor
        //getStartedButton.layer.cornerRadius = 10
        //getStartedButton.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        //getStartedButton.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MainScreenCell
        print(indexPath.row)
//        if indexPath.row == 0{
//            cell?.imageView.image = nil
//            cell?.titleLabel.text = titles[indexPath.row]
//            cell?.titleLabel.font = UIFont.systemFont(ofSize: 28)
//            cell?.logo.image = nil
//            cell?.descriptionLabel.text = descriptions[indexPath.row]
//            cell?.descriptionLabel.font = UIFont.systemFont(ofSize: 26)
//        }
//        else{
            //cell?.backgroundColor = .gray
            cell?.imageView.image = UIImage(named: imageNames[indexPath.row])
            cell?.titleLabel.text = titles[indexPath.row]
            cell?.titleLabel.sizeToFit()
            //cell?.titleLabel.font = UIFont(name: "sailecbold", size: 24.0)
            cell?.logo.image = UIImage(named: logoNames[indexPath.row])
            cell?.descriptionLabel.text = descriptions[indexPath.row]
            cell?.descriptionLabel.sizeToFit()
        //}
        
        return cell ?? MainScreenCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size // to return cell  size as same as CV
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
