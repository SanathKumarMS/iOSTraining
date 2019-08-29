//
//  AboutUsVM.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 29/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class AboutUsVM: BaseVM {
    
    var aboutItems: [About] = []
    var gridItems: [Grid] = []
    
    override init() {
        aboutItems = [About(image: "about1"), About(image: "about2"), About(image: "about3"), About(image: "about4")]
        
        gridItems = [Grid(name: "Clients"), Grid(name: "Board of Members"), Grid(name: "Locations"), Grid(name: "Experts")]
    }
}
