//
//  CareerModel.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation


struct Root: Decodable{
    let data: [Opening]
}

struct Opening: Decodable{
    let domain: String
    let position: String
    let location: String
}
