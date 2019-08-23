//
//  NewsVC.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 23/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class NewsVC: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    var news: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        news = News.getFeatured()
        
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0: tableView.backgroundColor = .gray
                news = News.getFeatured()
                tableView.reloadData()
        case 1: tableView.backgroundColor = .red
                news = News.getDesign()
                tableView.reloadData()
        case 2: tableView.backgroundColor = .green
                news = News.getEbooks()
                tableView.reloadData()
        default: break
        }
    }
    

}

extension NewsVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: "NewsTVCell"), for: indexPath) as? NewsTVCell
        
        //cell?.textLabel?.text = "Testing"
        cell?.newsImageView.image = news[indexPath.row].getImage()
        cell?.newsCategory.text = news[indexPath.row].getCategory().uppercased()
        cell?.newsCategory.textColor = UIColor.lightGray
        cell?.newsDescription.text = news[indexPath.row].getDescription()
        cell?.newsDescription.font = UIFont.systemFont(ofSize: 40)
        return cell ?? NewsTVCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height
    }
}

class News
{
    let image: String
    let category: String
    let description: String
    let url: String
    
    init(image: String, category: String, description: String, url: String) {
        self.image = image
        self.category = category
        self.description = description
        self.url = url
    }
    
    func getImage() -> UIImage?{
        guard let url = URL(string: image) else { return nil }
        if let data = try? Data(contentsOf: url)
        {
            let image: UIImage = UIImage(data: data) ?? UIImage()
            return image
        }
        return UIImage()
    }
    
    func getCategory() -> String{
        return category
    }
    
    func getDescription() -> String{
        return description
    }
    
    static func getFeatured() -> [News]{
        var featured : [News] = []
        let adam = News(image: "https://ymedialabs.com/wp-content/uploads/2019/08/adam_talcott_hero.jpg", category: "AGENCY / CULTURE / UNDEFINED / UNCATEGORIZED", description: "Getting to Know: Adam Talcott – Software Engineering Manager at YML", url: "")
        let oneway = News(image: "https://ymedialabs.com/wp-content/uploads/2019/07/choice-oneway-header.jpg", category: "Customer Experience", description: "Stuck in the “Paradox of Choice”? Use Recommendations to Build Better CX", url: "")
        let cfo = News(image: "https://ymedialabs.com/wp-content/uploads/2019/07/hamish-long.jpg", category: "Agency / Culture / undefined", description: "Getting to Know Hamish Macphail — Chief Financial Officer at Y Media Labs", url: "")
        
        featured.append(adam)
        featured.append(oneway)
        featured.append(cfo)
        
        return featured
    }
    
    static func getDesign() -> [News]{
        var designs : [News] = []
        let mcd = News(image: "https://ymedialabs.com/wp-content/uploads/2019/07/mcdonalds-lead.jpeg", category: "Agency / Culture / Design / Leadership / Technology", description: "We Are People: What it Means to Have a People-First Approach", url: "")
        let ux = News(image: "https://ymedialabs.com/wp-content/uploads/2019/07/1_CpkmgfGBP59ieX6t6dT2wA.png", category: "Design / Technology", description: "Speaking the Same Language: How UX and Data Strategy Can Work Together to Design for Voice-Based AI", url: "")
        
        designs.append(mcd)
        designs.append(ux)
        
        return designs
    }
    static func getEbooks() -> [News]{
        var ebooks : [News] = []
        let chatbots = News(image: "https://ymedialabs.com/wp-content/uploads/2017/04/CHATBOTS3-1.jpg", category: "Ebooks", description: "Chatbots in the Banking Industry – Discussing a More Efficient Future", url: "")
        let app = News(image: "https://ymedialabs.com/wp-content/uploads/2017/04/hybrid-native_700-1.jpg", category: "Ebooks", description: "How to Choose Wisely Between a Native and a Hybrid Application", url: "")
        
        ebooks.append(chatbots)
        ebooks.append(app)
        
        return ebooks
    }
}

//class Featured: News
//{
//    static func getFeatured() -> [Featured]
//    {
//        var featured: [Featured] = []
//
//        let adam = Featured(image: "", category: "AGENCY/CULTURE/UNDEFINED/UNCATEGORIZED", description: "Getting to Know: Adam Talcott – Software Engineering Manager at YML", url: "")
//        let oneway = Featured(image: "", category: "Customer Experience", description: "Stuck in the “Paradox of Choice”? Use Recommendations to Build Better CX", url: "")
//        let cfo = Featured(image: "", category: "Agency / Culture / undefined", description: "Getting to Know Hamish Macphail — Chief Financial Officer at Y Media Labs", url: "")
//
//        featured.append(adam)
//        featured.append(oneway)
//        featured.append(cfo)
//
//        return featured
//    }
//}
