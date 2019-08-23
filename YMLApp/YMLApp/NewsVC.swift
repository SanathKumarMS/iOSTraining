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
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black
        
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0: news = News.getFeatured()
        case 1: news = News.getDesign()
        case 2: news = News.getEbooks()
        default: break
        }
        tableView.reloadData()
    }
    

}

extension NewsVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: "NewsTVCell"), for: indexPath) as? NewsTVCell
        
        cell?.newsImageView.image = UIImage(named: news[indexPath.row].getImage())
        cell?.newsCategory.text = news[indexPath.row].getCategory().uppercased()
        cell?.newsCategory.textColor = UIColor.lightGray
        cell?.newsDescription.text = news[indexPath.row].getDescription()
        cell?.newsDescription.font = UIFont.systemFont(ofSize: 40)
        return cell ?? NewsTVCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let newWebViewVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: NewsWebViewVC.self)) as? NewsWebViewVC
        {
            newWebViewVC.url = URL(string: news[indexPath.row].getURL())
            self.navigationController?.pushViewController(newWebViewVC, animated: true)
        }
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
    
    func getImage() -> String{
        return image
    }
    
    func getCategory() -> String{
        return category
    }
    
    func getDescription() -> String{
        return description
    }
    
    func getURL() -> String{
        return url
    }
    
    static func getFeatured() -> [News]{
        var featured : [News] = []
        let adam = News(image: "featured1", category: "AGENCY / CULTURE / UNDEFINED / UNCATEGORIZED", description: "Getting to Know: Adam Talcott – Software Engineering Manager at YML", url: "https://ymedialabs.com/getting-to-know-adam-talcott")
        let oneway = News(image: "featured2", category: "Customer Experience", description: "Stuck in the “Paradox of Choice”? Use Recommendations to Build Better CX", url: "https://ymedialabs.com/recommendations-improve-customer-experience")
        let cfo = News(image: "featured3", category: "Agency / Culture / undefined", description: "Getting to Know Hamish Macphail — Chief Financial Officer at Y Media Labs", url: "https://ymedialabs.com/getting-to-know-hamish-macphail-chief-financial-officer-at-y-media-labs")
        
        featured.append(contentsOf: [adam,oneway,cfo])
        
        return featured
    }
    
    static func getDesign() -> [News]{
        var designs : [News] = []
        let mcd = News(image: "design1", category: "Agency / Culture / Design / Leadership / Technology", description: "We Are People: What it Means to Have a People-First Approach", url: "https://ymedialabs.com/we-are-people-what-it-means-to-have-a-people-first-approach")
        let ux = News(image: "design2", category: "Design / Technology", description: "Speaking the Same Language: How UX and Data Strategy Can Work Together to Design for Voice-Based AI", url: "https://ymedialabs.com/recommendations-improve-customer-experience")

        designs.append(contentsOf: [mcd,ux])
        
        return designs
    }
    static func getEbooks() -> [News]{
        var ebooks : [News] = []
        let chatbots = News(image: "ebooks1", category: "Ebooks", description: "Chatbots in the Banking Industry – Discussing a More Efficient Future", url: "https://ymedialabs.com/chatbots-banking-industry-white-paper")
        let app = News(image: "ebook2", category: "Ebooks", description: "How to Choose Wisely Between a Native and a Hybrid Application", url: "https://ymedialabs.com/native-hybrid-application-ebook")
        
        ebooks.append(contentsOf: [chatbots,app])
        
        return ebooks
    }
}

