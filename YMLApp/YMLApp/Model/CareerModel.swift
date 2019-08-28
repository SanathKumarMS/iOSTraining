//
//  CareerModel.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation


struct Root: Codable{
    let data: [Opening]
}

struct Opening: Codable{
    let domain: String
    let position: String
    let location: String
}
