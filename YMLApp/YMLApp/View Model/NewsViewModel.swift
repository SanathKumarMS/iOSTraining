//
//  NewsViewModel.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation

class NewsViewModel{
    
    var newsItems: [News] = []
    
    enum Segment: Int{
        case featured
        case design
        case ebooks
    }
    
    func setNewsItems(_ segmentIndex: Int){
        switch segmentIndex{
        case Segment.featured.rawValue: getFeatured()
        case Segment.design.rawValue: getDesign()
        case Segment.ebooks.rawValue: getEbooks()
        default: print("Error")
        }
    }
    
    func getFeatured(){
        newsItems = []
        let adam = News(image: "featured1", category: "AGENCY / CULTURE / UNDEFINED / UNCATEGORIZED", description: "Getting to Know: Adam Talcott – Software Engineering Manager at YML", url: "https://ymedialabs.com/getting-to-know-adam-talcott")
        let oneway = News(image: "featured2", category: "Customer Experience", description: "Stuck in the “Paradox of Choice”? Use Recommendations to Build Better CX", url: "https://ymedialabs.com/recommendations-improve-customer-experience")
        let cfo = News(image: "featured3", category: "Agency / Culture / undefined", description: "Getting to Know Hamish Macphail — Chief Financial Officer at Y Media Labs", url: "https://ymedialabs.com/getting-to-know-hamish-macphail-chief-financial-officer-at-y-media-labs")
        
        newsItems.append(contentsOf: [adam,oneway,cfo])
    }
    
    func getDesign(){
        newsItems = []
        let mcd = News(image: "design1", category: "Agency / Culture / Design / Leadership / Technology", description: "We Are People: What it Means to Have a People-First Approach", url: "https://ymedialabs.com/we-are-people-what-it-means-to-have-a-people-first-approach")
        let ux = News(image: "design2", category: "Design / Technology", description: "Speaking the Same Language: How UX and Data Strategy Can Work Together to Design for Voice-Based AI", url: "https://ymedialabs.com/recommendations-improve-customer-experience")
        
        newsItems.append(contentsOf: [mcd,ux])
        
    }
    
    func getEbooks(){
        newsItems = []
        let chatbots = News(image: "ebooks1", category: "Ebooks", description: "Chatbots in the Banking Industry – Discussing a More Efficient Future", url: "https://ymedialabs.com/chatbots-banking-industry-white-paper")
        let app = News(image: "ebook2", category: "Ebooks", description: "How to Choose Wisely Between a Native and a Hybrid Application", url: "https://ymedialabs.com/native-hybrid-application-ebook")
        
        newsItems.append(contentsOf: [chatbots,app])
    }
    
}
