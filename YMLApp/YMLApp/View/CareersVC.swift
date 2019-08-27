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
            self.tableView.reloadData()
        }
        
        addGestureToVideo()
    }
    
    func addGestureToVideo(){
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


