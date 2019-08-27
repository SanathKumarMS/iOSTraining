//
//  ContactsViewModel.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation

class ContactsViewModel{
    let bangalore: Branch
    let sanFrancisco : Branch
    
    init() {
        bangalore = Branch(latitude: 12.9715, longitude: 77.5945, address: "150 Old Airport Road, Diamond District, Tower B, Lower Ground Floor, Kodihalli, Domlur, Bengaluru, Karnataka 560008")
        sanFrancisco = Branch(latitude: 37.524950, longitude: -122.258507, address: "255 Shoreline Dr, Redwood City, CA 94065, USA")
    }
}
