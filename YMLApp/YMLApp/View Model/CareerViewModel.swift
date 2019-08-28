//
//  CareerViewModel.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 27/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation
import HCVimeoVideoExtractor

class CareerViewModel{
    
    var jsonItems: [Opening] = []
    
    let jsonURL = "http://jsonstub.com/positions"
    let userKey = "5b87065d-b207-44fc-aa26-b9e1253720d6"
    let projectKey = "9a5070e8-cd53-46d4-ae0a-c25f3458c81c"
    let videoURL = "https://vimeo.com/293855154"
    
    typealias jsonHandler = (() -> Void)
    typealias videoHandler = ((URL) -> Void)
    
    
    func loadPositionsFromJson(_ compHandler: @escaping jsonHandler){
        
        let headers = ["Content-Type": "application/json", "JsonStub-User-Key" : userKey, "JsonStub-Project-Key": projectKey]
        NetworkManager.shared.get(urlString: jsonURL, headers: headers, successHandler: {
            [weak self] (data) in
            do{
                let root = try JSONDecoder().decode(Root.self, from: data)
                print(root)
                let data = root.data
                self?.jsonItems = data
                for item in data{
                    print(item.domain)
                    print(item.position)
                    print(item.location)
                }
                DispatchQueue.main.async {
                    compHandler()
                }
            }
            catch{
                print("Error")
            }
        })
    }

    
    func playVideo(_ completionHandler: @escaping videoHandler){
        guard let url = URL(string: videoURL) else{
            print("Invalid url")
            return
        }
        HCVimeoVideoExtractor.fetchVideoURLFrom(url: url, completion: { ( video:HCVimeoVideo?, error:Error?) -> Void in
            if let err = error {
                print("Error = \(err.localizedDescription)")
                return
            }
            
            guard let vid = video else {
                print("Invalid video object")
                return
            }
            
            print("Title = \(vid.title), url = \(vid.videoURL), thumbnail = \(vid.thumbnailURL)")
            
            if let videoURL = vid.videoURL[.Quality540p] {
                completionHandler(videoURL)
            }
        })
    }
    
}
