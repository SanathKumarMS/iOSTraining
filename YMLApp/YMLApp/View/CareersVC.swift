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
    
    var viewModel = CareerViewModel()
  
    
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var player: AVPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadPositionsFromJson(){ () -> Void in
            DispatchQueue.main.async {
              self.tableView.reloadData()
            }
        }
        videoView.backgroundColor = .white
        let playPauseTapGesture = UITapGestureRecognizer(target: self, action: #selector(playPauseVideo))
        videoView.addGestureRecognizer(playPauseTapGesture)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.playVideo({(videoURL: URL) -> Void in
            self.player = AVPlayer(url: videoURL)
            let playerLayer = AVPlayerLayer(player: self.player)
            playerLayer.frame = self.videoView.frame
            self.view.layer.addSublayer(playerLayer)
            self.player.play()
        })
    }
    
//    func playVideo(){
//        guard let url = URL(string: "https://vimeo.com/293855154") else{
//            print("Invalid url")
//            return
//        }
//        HCVimeoVideoExtractor.fetchVideoURLFrom(url: url, completion: { ( video:HCVimeoVideo?, error:Error?) -> Void in
//            if let err = error {
//                print("Error = \(err.localizedDescription)")
//                return
//            }
//
//            guard let vid = video else {
//                print("Invalid video object")
//                return
//            }
//
//            print("Title = \(vid.title), url = \(vid.videoURL), thumbnail = \(vid.thumbnailURL)")
//
//            if let videoURL = vid.videoURL[.Quality540p] {
//                self.player = AVPlayer(url: videoURL)
//                let playerLayer = AVPlayerLayer(player: self.player)
//                playerLayer.frame = self.videoView.frame
//                self.view.layer.addSublayer(playerLayer)
//                self.player.play()
//                //                let playerController = AVPlayerViewController()
//                //                playerController.player = player
//                //                self.present(playerController, animated: true) {
//                //                    player.play()
//                //                }
//            }
//        })
//    }
    
    @objc func playPauseVideo(_ sender: UITapGestureRecognizer)
    {
        if player.rate != 0{
            player.pause()
        }
        else{
            player.play()
        }
    }
    
}


