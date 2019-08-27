//
//  WorkViewModel.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation

class WorkViewModel{
    
    lazy var workProducts: [WorkProduct] = []
    
    init() {
        initialize()
    }
    
    func initialize(){
        
        let northFace = WorkProduct(image: "north-face-featured-1", title: "THE NORTH FACE", description: "How The North Face redefined loyalty to embrace the great outdoors", url: "https://ymedialabs.com/project/the-north-face")
        let clover = WorkProduct(image: "clover-featured", title: "CLOVER", description: "How Clover Go has become an open ecosystem for point-of-sale payments", url: "https://ymedialabs.com/project/clover")
        let creditOne = WorkProduct(image: "creditone-featured", title: "CREDIT ONE", description: "How Credit One has become America's fastest growing credit card issuer", url: "https://ymedialabs.com/project/credit-one")
        
        workProducts.append(contentsOf: [northFace, clover, creditOne])
    }
    
    func noOfItems() -> Int{
        return workProducts.count
    }
    
//    func getImage() -> String{
//        return image
//    }
//
//    func getTitle() -> String{
//        return title
//    }
//
//    func getDescription() -> String{
//        return description
//    }
//
//    func getURL() -> String{
//        return url
//    }
}
