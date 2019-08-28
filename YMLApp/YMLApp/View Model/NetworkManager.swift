//
//  NetworkManager.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation

class NetworkManager{
    
    static let shared = NetworkManager()
    
    private init(){
    }
    
    func check(){
        print("In GET")
    }
    
    func get(request: URLRequest, comp: @escaping (Data?, URLResponse?, Error?) -> Void){
//        URLSession.shared.dataTask(with: request) {[weak self] (data, respnse, err) in
//            guard let weaself = self else { return }
//            comp(data, respnse, err)
//        }
    }
}



