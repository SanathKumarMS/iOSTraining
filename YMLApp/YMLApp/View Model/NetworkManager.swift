//
//  NetworkManager.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation

protocol HTTPMethods{
    func get(urlString: String, headers: [String: String]?, successHandler: @escaping (Data) -> Void)
    func post(urlString: String, dataToUpload: [Opening], headers: [String: String]?, succesHandler: @escaping () -> Void)
}


class NetworkManager: HTTPMethods{
    
    static let shared = NetworkManager()
    
    private init(){
    }
    
    func get(urlString: String, headers: [String : String]? = nil, successHandler: @escaping (Data) -> Void) {
        guard let url = URL(string: urlString) else { return}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        if let headers = headers{
            for (key,value) in headers{
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
        }
        URLSession.shared.dataTask(with: urlRequest, completionHandler: {(data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            if let response = response as? HTTPURLResponse{
                if response.statusCode >= 200 && response.statusCode < 300{
                    if let data = data{
                        successHandler(data)
                    }
                    else{
                        print("Invalid Data")
                        return
                    }
                }
                else{
                    print("Invalid response")
                    return
                }
            }
        }).resume()
    }
    
    func post(urlString: String, dataToUpload: [Opening], headers: [String : String]? = nil, succesHandler: () -> Void) {
        guard let url = URL(string: urlString) else { return}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        if let headers = headers{
            for (key,value) in headers{
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
        }
        //let data = Data(base64Encoded: "This is the data to upload")
        guard let uploadData = try? JSONEncoder().encode(dataToUpload) else {
            return
        }
        URLSession.shared.uploadTask(with: urlRequest, from: uploadData, completionHandler: {
            (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            if let response = response as? HTTPURLResponse{
                if response.statusCode >= 200 && response.statusCode < 300{
                    if let mimeType = response.mimeType{
                        //if mimeType == "application/json"
                    }
                    else{
                        print("Invalid Data")
                        return
                    }
                }
                else{
                    print("Invalid response")
                    return
                }
            }
        }).resume()
    }
    
//    func get(request: URLRequest, comp: @escaping (Data?, URLResponse?, Error?) -> Void){
////        URLSession.shared.dataTask(with: request) {[weak self] (data, respnse, err) in
////            guard let weaself = self else { return }
////            comp(data, respnse, err)
////        }
//
//        URLSession.shared.dataTask(with: request, completionHandler: comp)
//        .resume()
//    }
//
//    func get(request: URLRequest, successHandler: @escaping (Data) -> Void){
//        let completionHandler: (Data?, URLResponse?, Error?) -> Void = {(data, response, error) in
//            if let error = error{
//                print(error.localizedDescription)
//            }
//            if let response = response as? HTTPURLResponse{
//                if response.statusCode >= 200 && response.statusCode < 300{
//                    guard let data = data else { return}
//                    successHandler(data)
//                }
//                else{
//                    print("Invalid response")
//                }
//            }
//        }
//        URLSession.shared.dataTask(with: request, completionHandler: completionHandler)
//    }
}



