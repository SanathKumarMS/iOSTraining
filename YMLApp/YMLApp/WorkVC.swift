//
//  WorkVC.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 22/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class WorkVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var workProducts: [WorkProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workProducts = WorkProduct.getWorkProducts()
    }
    

}


extension WorkVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkCell", for: indexPath) as? WorkTVCell
        
        cell?.backgroundColor = .white
        cell?.workImageView?.image = UIImage(named: workProducts[indexPath.row].getImage())
        cell?.workTitle.text = workProducts[indexPath.row].getTitle()
        cell?.workTitle.textColor = UIColor.lightGray
        cell?.workTitle.font = UIFont.boldSystemFont(ofSize: 20)
        cell?.workDescription.text = workProducts[indexPath.row].getDescription()
        cell?.workDescription.font = UIFont.systemFont(ofSize: 40)
        cell?.selectionStyle = .none
        return cell ?? WorkTVCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let workWebViewVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: "WorkWebViewVC")) as? WorkWebViewVC{
            workWebViewVC.url = URL(string: workProducts[indexPath.row].getURL())
            self.navigationController?.pushViewController(workWebViewVC, animated: true)
        }
        
    }
    
}

struct WorkProduct
{
    let image: String
    let title: String
    let description: String
    let url: String
    
    static func getWorkProducts() -> [WorkProduct]{
        var workProducts: [WorkProduct] = []
        
        let northFace = WorkProduct(image: "north-face-featured-1", title: "THE NORTH FACE", description: "How The North Face redefined loyalty to embrace the great outdoors", url: "https://ymedialabs.com/project/the-north-face")
        let clover = WorkProduct(image: "clover-featured", title: "CLOVER", description: "How Clover Go has become an open ecosystem for point-of-sale payments", url: "https://ymedialabs.com/project/clover")
        let creditOne = WorkProduct(image: "creditone-featured", title: "CREDIT ONE", description: "How Credit One has become America's fastest growing credit card issuer", url: "https://ymedialabs.com/project/credit-one")
        workProducts.append(northFace)
        workProducts.append(clover)
        workProducts.append(creditOne)
        
        return workProducts
    }
    
    func getImage() -> String{
        return image
    }
    
    func getTitle() -> String{
        return title
    }
    
    func getDescription() -> String{
        return description
    }
    
    func getURL() -> String{
        return url
    }
}
