//
//  MainScreenViewModel.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation

class MainScreenViewModel{
    
    var products: [Product] = []
    
    func initialize(){

        let helloPage = Product(imageName: "", logoName: "", title: "Hello", description: "We are a design and innovation agency, creating digital products and experiences that have a lasting impact.")
        let stateFarm = Product(imageName: "mobile-70", logoName: "4logo", title: "State Farm", description: "All things insurance, all things banking, all in one app.")
        let homeDepot = Product(imageName: "home-depot-mobile", logoName: "2logo", title: "The Home Depot", description: "The ultimate power tool: A best-in-class digital experience for The Home Depot.")
        let paypal = Product(imageName: "home-mob", logoName: "3logo", title: "PayPal", description: "Payment giant goes mobile-by-design.")
        let molekule = Product(imageName: "molekule-mobile2", logoName: "1logo", title: "Molekule", description: "The world's first intelligent air purifier, & the app putting clean air in people's hands.")
        
        products.append(contentsOf: [helloPage, stateFarm, homeDepot, paypal, molekule])
    }
}
