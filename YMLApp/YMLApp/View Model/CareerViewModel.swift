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
    
    var jsonItems: [Data] = []
    
    let jsonURL = "http://jsonstub.com/positions"
    let userKey = "5b87065d-b207-44fc-aa26-b9e1253720d6"
    let projectKey = "9a5070e8-cd53-46d4-ae0a-c25f3458c81c"
    let videoURL = "https://vimeo.com/293855154"
    
    typealias jsonHandler = (() -> Void)
    typealias videoHandler = ((URL) -> Void)
    
    func loadPositionsFromJson(_ compHandler: @escaping jsonHandler){
        
        //
        guard let url = URL(string: jsonURL) else { return }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(userKey, forHTTPHeaderField: "JsonStub-User-Key")
        request.addValue(projectKey, forHTTPHeaderField: "JsonStub-Project-Key")
        //In Network Manager
        
        let session = URLSession.shared.dataTask(with: request, completionHandler: {
            //
            data,response,error in
            
            if let error = error{
                print(error)
            }
            if let _ = response, let data = data{
                
                do {
                    //print(String(data: data, encoding: .utf8) ?? "")
                    let root = try JSONDecoder().decode(Root.self, from: data)
                    //print(root)
                    let data = root.data
                    self.jsonItems = data
                    for item in data{
                        print(item.domain)
                        print(item.position)
                        print(item.location)
                    }
                    DispatchQueue.main.async {
                        compHandler()
                    }
                } catch {
                    print("Error : \(error)")
                }
            }
            //In VM (Here only)
        })
        session.resume()
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
