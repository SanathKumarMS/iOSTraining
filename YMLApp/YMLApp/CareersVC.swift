//
//  CareersVC.swift
//  YMLApp
//
//  Created by Sanath Kumar M S on 26/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import HCVimeoVideoExtractor

class CareersVC: UIViewController {
    
    struct Root: Decodable{
        let data: [Data]
    }
    
    struct Data: Decodable{
        let domain: String
        let position: String
        let location: String
    }
    
    var jsonItems: [Data] = []
    
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var player: AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadPositionsFromJson()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        playVideo()
        
    }
    
    func playVideo(){
        guard let url = URL(string: "https://vimeo.com/293855154") else{
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
                let player = AVPlayer(url: videoURL)
                let playerLayer = AVPlayerLayer(player: player)
                playerLayer.frame = self.videoView.frame
                self.view.layer.addSublayer(playerLayer)
                player.play()
                //                let playerController = AVPlayerViewController()
                //                playerController.player = player
                //                self.present(playerController, animated: true) {
                //                    player.play()
                //                }
            }
        })
    }
    
    func loadPositionsFromJson(){
        guard let url = URL(string: "http://jsonstub.com/positions") else { return }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("5b87065d-b207-44fc-aa26-b9e1253720d6", forHTTPHeaderField: "JsonStub-User-Key")
        request.addValue("9a5070e8-cd53-46d4-ae0a-c25f3458c81c", forHTTPHeaderField: "JsonStub-Project-Key")
        
        let session = URLSession.shared.dataTask(with: request, completionHandler: { data,response,error in
            
            if let error = error{
                print(error)
            }
            if let response = response, let data = data{
                
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
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Error : \(error)")
                }
            }
        })
        session.resume()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //player.pause()
    }
}


extension CareersVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CareersVCCell.self)) as? CareersVCCell
        //cell?.backgroundColor = .lightGray
        cell?.domainLabel.text = jsonItems[indexPath.row].domain
        cell?.domainLabel.font = UIFont.systemFont(ofSize: 18)
        cell?.domainLabel.textColor = .lightGray
        cell?.positionLabel.text = jsonItems[indexPath.row].position
        cell?.positionLabel.font = UIFont.systemFont(ofSize: 28)
        cell?.locationLabel.text = jsonItems[indexPath.row].location
        cell?.locationLabel.font = UIFont.systemFont(ofSize: 18)
        
        return cell ?? CareersVCCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height
    }
    
    
}
