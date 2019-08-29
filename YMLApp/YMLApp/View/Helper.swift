//
//  Helper.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 29/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation
import UIKit

class Helper{
    
    static func openApp(rawString: String, appType: AppType, latitude: Double? = nil, longitude: Double? = nil){
        var urlString = rawString
        switch appType {
        case .phone:
            urlString = "tel://" + urlString
        case .mail:
            urlString = "mailto:" + urlString
        case .appleMaps:
            if let latitude = latitude, let longitude = longitude{
                let query = "?daddr=\(String(describing: latitude)),\(String(describing: longitude))"
                urlString = "http://maps.apple.com/\(query)&dirflg=d&t=h"
            }
        case .googleMaps:
            if let latitude = latitude, let longitude = longitude{
                urlString = "comgooglemaps://?saddr=&daddr=\(String(describing: latitude)),\(String(describing: longitude))&directionsmode=driving"
            }
        }
        if let url = URL(string: urlString){
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url)
            }
        }
    }
}

enum AppType
{
    case phone
    case mail
    case appleMaps
    case googleMaps
}
