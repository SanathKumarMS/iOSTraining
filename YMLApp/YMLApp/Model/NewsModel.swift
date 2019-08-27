//
//  NewsModel.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation

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
}
